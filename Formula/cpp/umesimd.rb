class Umesimd < Formula
  desc "Explicit vectorization library"
  homepage "https://github.com/edanor/umesimd"
  # url "https://github.com/edanor/umesimd/archive/v0.8.1.tar.gz"
  head "https://github.com/edanor/umesimd.git", branch: "master"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <umesimd/UMESimd.h>
      template<typename VEC_T>
        void printVector(VEC_T & v) {
        for(int i = 0; i < VEC_T::length(); i++) {
          std::cout << v[i] << " ";
        }
      }
      int main() {
        UME::SIMD::SIMD4_64f a(5., 3., 8., 4.);
        printVector(a);
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test"
    assert_equal "5 3 8 4 ", shell_output("./test").chomp
  end
end
