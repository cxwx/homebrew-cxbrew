class FastIo < Formula
  desc "Freestanding fast input/output for C++20"
  homepage "https://github.com/cppfastio/fast_io"
  license "MIT"
  head "https://github.com/cppfastio/fast_io.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do # TODO:
    (testpath/"test.cpp").write <<~CPP
      #include <fast_io.h>
      int main() {
	      fast_io::io::print("Hello, fast_io world!\\n");
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++20", "-o", "test"
    assert_equal shell_output("./test").chomp, "Hello, fast_io world!"
  end
end
