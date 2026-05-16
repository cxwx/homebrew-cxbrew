class Vecmath < Formula
  desc "Collection of vectorized based math utilities based on VecCore library"
  homepage "https://github.com/root-project/vecmath"
  url "https://github.com/root-project/vecmath/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9d032db33a3d88d9c4477b0cc1a1975466cf14e580f305dfa6706b733646f632"
  license "LGPL-2.1-or-later"
  revision 1

  depends_on "cmake" => :build
  depends_on "vc"
  depends_on "vdt"

  def install
    system "cmake", "-S", ".", "-B", "builddir",
           "-DBACKEND=Vc",
           "-DVc_DIR=#{Formula["vc"].opt_lib}/cmake/Vc",
           "-DBUILD_SHARED_LIBS=ON",
           *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <VecMath/Math.h>
      #include <cassert>
      #include <cmath>

      int main() {
        // Test that the library compiles and links
        double x = 1.0;
        double result = vecMath::FastExp(x);
        assert(std::abs(result - std::exp(x)) < 0.01);
        return 0;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++14", "-I#{include}", "-I#{Formula["vc"].opt_include}", "-o", "test"
    system "./test"
  end
end
