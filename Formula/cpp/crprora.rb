# GPT(GEMINI):
class Crprora < Formula
  desc "public astrophysical simulation framework for propagating extraterrestrial ultra-high energy particles."
  homepage "https://crpropa.github.io/CRPropa3/" 
  # url "https://github.com/CRPropa/CRPropa3/archive/refs/tags/3.2.1.tar.gz" 
  # sha256 "b8e61eace48607c545a495c742479fb58e7ea34b8dfe7f874a14b8414135cccc"
  license "GPL-3.0"
  head "https://github.com/CRPropa/CRPropa3.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "git" => :build
  depends_on "gcc" => :build
  depends_on "swig"  => :build
  depends_on "hdf5"
  depends_on "libomp"
  depends_on "libaec"
  depends_on "python@3.14"


  def install
    ENV.fortran
    libomp = Formula["libomp"]
    # 针对 macOS 的特殊链接处理
    python_version = Language::Python.major_minor_version "python3.14"
    python_site_packages = prefix/"lib/python3.14/site-packages"
    python_site_packages.mkpath
    python_exe = Formula["python@3.14"].opt_bin/"python3.14"
    ENV.append "CPPFLAGS", "-Xpreprocessor -fopenmp -I#{libomp.opt_include}"
    ENV.append "LDFLAGS", "-L#{libomp.opt_lib} -lomp"
    args = %w[
      -DENABLE_TESTING=OFF
      -DDOWNLOAD_DATA=ON
      -DCMAKE_INSTALL_LIBDIR=lib
      -DOpenMP_CXX_FLAGS=-Xpreprocessor\ -fopenmp\ -I#{libomp.opt_include}
      -DOpenMP_omp_LIBRARY=#{libomp.opt_lib}/libomp.dylib
      -DOpenMP_CXX_LIB_NAMES=omp
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -DPYTHON_INSTALL_PREFIX=#{prefix}
      -DPYTHON_EXECUTABLE=#{Formula["python@3.14"].opt_bin}/python3.14
      -DPYTHON_SITE_PACKAGES=#{python_site_packages}
      -DMAKE_PY_INSTALL_PATH=#{python_site_packages}
      -DCMAKE_INSTALL_PYTHONDIR=#{python_site_packages}
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    mkdir_p python_site_packages
    # system "cmake", "--install", "builddir"  # BUG: install @ site-package not touchable
    # prefix.join("bin").mkpath
    # prefix.join("lib").mkpath
    # prefix.join("include").mkpath

    # 手动把 build 出来的二进制文件、库文件、Python 包拷进去
    # 注意：这里的路径需要根据 CRPropa 编译后的实际位置调整（通常在 builddir 目录下）
    # cp_r "builddir/lib/.", prefix/"lib" rescue nil
    # cp_r "builddir/bin/.", prefix/"bin" rescue nil
    # cp_r "builddir/share/.", prefix/"share" rescue nil
    # cp_r "builddir/include/.", prefix/"include" rescue nil
    
    # 搬运 Python 模块（CRPropa 编译出的文件夹通常叫 crpropa）
    # 假设它在 build 目录下某个地方，比如 builddir/python/crpropa
    # 你需要确认一下编译完后这个文件夹在 builddir 的哪个位置
    # cp_r "builddir/python/crpropa", python_site_packages rescue nil
  end
end
