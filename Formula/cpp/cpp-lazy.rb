class CppLazy < Formula
  desc "C++11 (and onwards) library for lazy evaluation"
  homepage "https://github.com/Kaaserne/cpp-lazy"
  url "https://github.com/Kaaserne/cpp-lazy/archive/refs/tags/v8.0.0.tar.gz"
  sha256 "02f29ff1e6b44fc0e34cb7c651ee4b4f806c63dfc699fc135db794424fdc119f"
  license "MIT"
  head "https://github.com/Kaaserne/cpp-lazy.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "fmt" => :test

  def install
    args = std_cmake_args + %w[
      -DCPP-LAZY_USE_STANDALONE=ON
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <cpp-lazy-7.0.2/Lz/Map.hpp>

      int main() {
        std::array<int, 4> arr = {1, 2, 3, 4};
        std::string result = lz::map(arr, [](int i) { return i + 1; }).toString(" "); // == "1 2 3 4"
      }
    CPP
    fmt_prefix = Formula["fmt"].opt_prefix
    fmt_include = fmt_prefix/"include"
    fmt_lib = fmt_prefix/"lib"

    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test", "-I#{fmt_include}/fmt", "-L#{fmt_lib}", "-lfmt"
    system "./test"
  end
end
