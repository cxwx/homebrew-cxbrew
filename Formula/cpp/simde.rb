class Simde < Formula
  desc "Header-only library implementing SIMD intrinsics on unsupported hardware"
  homepage "https://github.com/simd-everywhere/simde"
  url "https://github.com/simd-everywhere/simde/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "ed2a3268658f2f2a9b5367628a85ccd4cf9516460ed8604eed369653d49b25fb"
  license "MIT"

  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    system "meson", "setup", "builddir", *std_meson_args
    system "meson", "install", "-C", "builddir"
  end

  test do
    (testpath/"test.c").write <<~C
      #include <simde/x86/sse.h>
      #include <stdio.h>
      int main() {
        simde__m128 a = simde_mm_set_ps(1.0f, 2.0f, 3.0f, 4.0f);
        simde__m128 b = simde_mm_set_ps(5.0f, 6.0f, 7.0f, 8.0f);
        simde__m128 c = simde_mm_add_ps(a, b);
        float r[4];
        simde_mm_storeu_ps(r, c);
        return (r[0] == 12.0f) ? 0 : 1;
      }
    C
    system ENV.cc, "test.c", "-o", "test", "-I#{include}"
    system "./test"
  end
end
