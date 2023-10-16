class Erfa < Formula
  desc "Essential Routines for Fundamental Astronomy"
  homepage "https://github.com/liberfa/erfa"
  #url "https://github.com/liberfa/erfa/releases/download/v2.0.1/erfa-2.0.1.tar.gz"
  #url "https://codeload.github.com/liberfa/erfa/tar.gz/refs/tags/v2.0.1"
  url "https://github.com/liberfa/erfa/archive/refs/tags/v2.0.1.tar.gz"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "./bootstrap.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
