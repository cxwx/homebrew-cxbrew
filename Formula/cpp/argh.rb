class Argh < Formula
  desc "minimalist argument handler"
  homepage "https://github.com/adishavit/argh"
  # url ""
  license "BSD-3-Clause"
  head "https://github.com/adishavit/argh.git", branch: "master"

  depends_on "cmake" => :build

  uses_from_macos "python" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
    #include <vdt/sin.h>
    #include <iostream>
    using namespace std;
    int main() {
      cout << vdt::fast_sin(0.0) << endl;
    }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++14", "-o", "test", "-L#{lib}", "-lvdt"
    assert_equal "0", shell_output("./test").chomp
  end
end
