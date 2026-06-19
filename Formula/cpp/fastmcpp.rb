class Fastmcpp < Formula
  desc "High-performance C++ implementation of the Model Context Protocol (MCP)"
  homepage "https://github.com/0xeb/fastmcpp"
  license "Apache-2.0"
  head "https://github.com/0xeb/fastmcpp.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "cpp-httplib"
  depends_on "nlohmann-json"

  def install
    # 上游用 FetchContent 在 build 时下载 nlohmann_json/cpp_httplib;brew sandbox 会阻止网络,
    # 改用 brew 的这两个包(上游 nlohmann_json 段已有 if(NOT TARGET) 守卫,加 find_package 即可跳过;
    # cpp_httplib 段是无条件 FetchContent,整体换成 find_path 用 brew 的 header)。
    inreplace "CMakeLists.txt" do |s|
      s.gsub! "# nlohmann_json dependency - use existing target if available (e.g., from vcpkg)",
              "# nlohmann_json dependency - use existing target if available (e.g., from vcpkg)\n" \
              "find_package(nlohmann_json REQUIRED)"
      httplib_re = Regexp.new(
        "# Header-only HTTP library \\(cpp-httplib\\).*?" \
        "target_include_directories\\(fastmcpp_core PUBLIC \\$\\{cpp_httplib_SOURCE_DIR\\}\\)",
        Regexp::MULTILINE,
      )
      s.gsub! httplib_re,
              "# cpp-httplib: 用 brew cpp-httplib 的 header(替代 FetchContent)\n" \
              "find_path(CPPHTTPLIB_INCLUDE_DIR httplib.h REQUIRED)\n" \
              "target_include_directories(fastmcpp_core PUBLIC ${CPPHTTPLIB_INCLUDE_DIR})"
    end

    args = %W[
      -DFASTMCPP_BUILD_TESTS=OFF
      -DFASTMCPP_BUILD_EXAMPLES=OFF
      -DFASTMCPP_FETCH_CURL=OFF
      -DFASTMCPP_ENABLE_OPENSSL=OFF
      -DCMAKE_PREFIX_PATH=#{Formula["nlohmann-json"].opt_prefix};#{Formula["cpp-httplib"].opt_prefix}
    ]
    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"

    # 上游无 install() 规则,手动装 cli/static lib/headers
    bin.install "builddir/fastmcpp"
    lib.install "builddir/libfastmcpp_core.a"
    include.install "include/fastmcpp.hpp"
    include.install "include/fastmcpp"
  end

  test do
    assert_match "fastmcpp", shell_output("#{bin}/fastmcpp --help")
  end
end
