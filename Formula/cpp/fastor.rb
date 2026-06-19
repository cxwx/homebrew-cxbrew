class Fastor < Formula
  desc "Lightweight high-performance tensor algebra framework for modern C++"
  homepage "https://github.com/romeric/Fastor"
  url "https://github.com/romeric/Fastor/archive/refs/tags/V0.6.4.tar.gz"
  sha256 "c97a3b9dbb92413be90689af9d942cddee12a74733cf42f1a8014965553a11f8"
  license "MIT"

  def install
    # Fix x86 inline asm that fails on ARM64
    inreplace "Fastor/config/cpuid.h",
      "    asm volatile",
      "#if defined(__x86_64__) || defined(__i386__)\n    asm volatile"
    inreplace "Fastor/config/cpuid.h",
      "       : \"a\" (i), \"c\" (0));",
      "       : \"a\" (i), \"c\" (0));\n#else\n    regs[0] = regs[1] = regs[2] = regs[3] = 0;\n#endif"
    rdtsc_replacement = "#if defined(__x86_64__) || defined(__i386__)\n    " \
                        "__asm__ __volatile__ (\"rdtsc\" : \"=a\" (lo), \"=d\" (hi));\n" \
                        "#else\n    lo = hi = 0;\n#endif"
    inreplace "Fastor/util/timeit.h",
      "    __asm__ __volatile__ (\"rdtsc\" : \"=a\" (lo), \"=d\" (hi));",
      rdtsc_replacement

    (include/"Fastor").install Dir["Fastor/*"]
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <Fastor/tensor/Tensor.h>
      int main() {
        Fastor::Tensor<double,3,3> A;
        A.zeros();
        A(0,0) = 1.0; A(1,1) = 1.0; A(2,2) = 1.0;
        return A.sum() == 3.0 ? 0 : 1;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++14", "-I#{include}", "-o", "test"
    system "./test"
  end
end
