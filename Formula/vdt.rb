# TODO: SSE BUG
class Vdt < Formula
  desc "Mathematical library"
  homepage "https://github.com/dpiparo/vdt"
  url "https://github.com/dpiparo/vdt/archive/v0.4.4.tar.gz"
  sha256 "8b1664b45ec82042152f89d171dd962aea9bb35ac53c8eebb35df1cb9c34e498"
  license "LGPL"
  head "https://github.com/dpiparo/vdt.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <cpp-lazy/Lz/Map.hpp>

      int main() {
        std::array<int, 4> arr = {1, 2, 3, 4};
        std::string result = lz::map(arr, [](int i) { return i + 1; }).toString(" "); // == "1 2 3 4"
      }
    CPP
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["fmt"].opt_lib/"pkgconfig"
    cxxflags = shell_output("pkg-config --cflags fmt").strip
    ldflags = shell_output("pkg-config --libs fmt").strip
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test", *cxxflags.split, *ldflags.split
    system "./test"
  end
end
