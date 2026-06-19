# TODO: .so .dylib
class Libtap < Formula
  desc "https://github.com/zorgnax/libtap"
  homepage "https://github.com/zorgnax/libtap"
  url "https://github.com/zorgnax/libtap/archive/refs/tags/0.1.0.tar.gz"
  sha256 "eac69e0fb4ac0406c2b6173ffaf89f5411b9aa7d4de17fb07a95f86136653752"
  license "LGPL-3.0-or-later"
  head "https://github.com/zorgnax/libtap.git", branch: "master"

  # depends_on "make" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end
  test do
    (testpath/"test.c").write <<~CPP
      #include "tap.h"
      int main () {
        // plan(1);
        ok(50 + 5, "foo %s", "bar");
        // done_testing();
      }
    CPP
    system "gcc", "test.c", "-o", "test", "-L#{lib}", "-ltap"
    assert_equal "ok 1 - foo bar\n", shell_output("./test")
  end
end
