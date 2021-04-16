class Erfa < Formula
  desc "Essential Routines for Fundamental Astronomy"
  homepage "https://github.com/liberfa/erfa"
  url "https://github.com/liberfa/erfa/releases/download/v1.7.2/erfa-1.7.2.tar.gz"
  #  sha256 "f0787e30e848750c0cbfc14827de6fc7f69a2d5ef0fc653504e74b8967a764e0"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
