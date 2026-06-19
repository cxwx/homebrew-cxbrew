class WideInteger < Formula
  desc "Generic C++ template for uint128_t, uint256_t, uint512_t, uint1024_t, etc."
  homepage "https://github.com/ckormanyos/wide-integer"
  url "https://github.com/ckormanyos/wide-integer/archive/refs/tags/v1.01.tar.gz"
  sha256 "d295c92a6c70b89f8901f31bcc3f0e8128b5ff5e60e549f4063196b0b3bc9603"
  license "BSL-1.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir", "-DWIDE_INTEGER_ENABLE_TESTS=OFF", *std_cmake_args
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <math/wide_integer/uintwide_t.h>
      int main() {
        using uint256_t = ::math::wide_integer::uint256_t;
        uint256_t a("1");
        return a == 1 ? 0 : 1;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++14", "-I#{include}", "-o", "test"
    system "./test"
  end
end
