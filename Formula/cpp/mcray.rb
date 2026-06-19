class Mcray < Formula
  desc "Monte Carlo framework for ultra-high energy cosmic ray propagation (CRbeam app)"
  homepage "https://github.com/okolo/mcray"
  url "https://github.com/okolo/mcray/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "6af2125e82b9aa39a4684b147e5959ad3dc63fe1cdd02d9a7e9b91b23ce5d9f9"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "cmake" => :build
  depends_on "gsl"
  depends_on "boost"
  depends_on "libomp"
  depends_on "gcc" # gfortran,编译 SOPHIA(Fortran)子库

  def install
    # C/C++ 用 clang(macOS 默认):必须和 brew boost(clang/libc++ 编译)ABI 一致,
    # 否则 boost::filesystem 跨 std::string 边界会内存损坏崩溃。Fortran 用 gfortran(ENV.fortran)。
    ENV.fortran
    ENV.append "CPPFLAGS", "-I#{Formula["libomp"].opt_include}"
    ENV.append "LDFLAGS", "-L#{Formula["libomp"].opt_lib}"
    ENV.append "LDFLAGS", "-L#{Formula["gcc"].opt_lib}/gcc/current" # 链接 -lgfortran(SOPHIA)

    # 上游 CMakeLists 非标准,需多处适配 macOS:
    inreplace %w[src/app/crbeam/CMakeLists.txt src/lib/CMakeLists.txt] do |s|
      # 1) -Wl,--as-needed 是 GNU ld flag,macOS ld64 不支持
      s.gsub!(/ ?-Wl,--as-needed/, "")
      # 2) boost_system 在新版 Boost(>=1.69)是 header-only,无 lib,FIND_LIBRARY 会 NOTFOUND
      s.gsub!(/FIND_LIBRARY\(BOOST_SYS_LIBRARY boost_system\)/, 'set(BOOST_SYS_LIBRARY "")')
      # 3) Apple clang 不支持 -fopenmp(需 -Xpreprocessor -fopenmp);只改 C/CXX 行,Fortran 行保留
      s.gsub!('"${CMAKE_C_FLAGS} -fopenmp"', '"${CMAKE_C_FLAGS} -Xpreprocessor -fopenmp"')
      s.gsub!('"${CMAKE_CXX_FLAGS} -fopenmp"', '"${CMAKE_CXX_FLAGS} -Xpreprocessor -fopenmp"')
      # 4) 链接 OpenMP:clang 用 -lomp 而非 -fopenmp
      s.gsub!("add_link_options(-fopenmp)", "add_link_options(-lomp)")
    end

    # 5) tables_dir 是全局变量,static init 时调 boost::dll::program_location(),
    #    该 API 在 macOS 的 dyld static-init 阶段不安全会崩,故延迟到 user_main(main 后 runtime 就绪)
    inreplace "src/lib/Utils.cpp",
              "    std::string tables_dir = default_tables_path() + DIR_DELIMITER_STR;",
              "    std::string tables_dir; // 延迟到 user_main 初始化(macOS static-init 阶段 boost::dll 会崩)"
    inreplace "src/app/crbeam/CRbeam.cpp",
              "int user_main(int argc, char** argv) {",
              "int user_main(int argc, char** argv) {\n    tables_dir = default_tables_path() + DIR_DELIMITER_STR;"

    args = %W[
      -DCMAKE_PREFIX_PATH=#{Formula["libomp"].opt_prefix};#{Formula["gsl"].opt_prefix};#{Formula["boost"].opt_prefix}
    ]
    # 上游构建非标准:source 是 src/app/crbeam(非顶层),它 via add_subdirectory 编 src/lib(mcray 库)
    system "cmake", "-S", "src/app/crbeam", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir", "--target", "CRbeam"

    bin.install "builddir/CRbeam"
    # CRbeam 运行时按 <prefix>/share/<prog_name>/tables 查找物理背景表(prog_name=binary 名=CRbeam)
    (share/"CRbeam").install "bin/tables"
  end

  test do
    # CRbeam 无 --version;无参数会跑模拟。验证能启动(找到 tables + 打印线程数)
    assert_match "Number of available threads", shell_output("#{bin}/CRbeam 2>&1", 0)
  end
end
