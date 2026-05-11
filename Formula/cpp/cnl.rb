class Cnl < Formula
  desc "C++ library of fixed-precision numeric classes"
  homepage "https://github.com/johnmcfarlane/cnl"
  url "https://github.com/johnmcfarlane/cnl/archive/refs/tags/v1.1.7.tar.gz"
  sha256 "41f9b94d71df315d7143866a06ec28b2481762ffce0ac42dfc8d53b27e7162c0"
  license "BSL-1.0"
  head "https://github.com/johnmcfarlane/cnl.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = %w[
      -DBUILD_TESTING=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <cnl/all.h>
      #include <iostream>

      int main() {
        cnl::scaled_integer<int> a{7};
        cnl::scaled_integer<int> b{3};
        auto c = a + b;
        std::cout << "7 + 3 = " << static_cast<int>(c) << std::endl;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++20", "-o", "test"
    system "./test"
  end
end
