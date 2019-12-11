class Ccfits < Formula
  desc "c++ fits api"
  homepage "https://heasarc.gsfc.nasa.gov/fitsio/CCfits/"
  url "https://heasarc.gsfc.nasa.gov/fitsio/CCfits/CCfits-2.5.tar.gz"
  sha256 "938ecd25239e65f519b8d2b50702416edc723de5f0a5387cceea8c4004a44740"

  bottle do
#    root_url "https://mirrors.ustc.edu.cn/homebrew-bottles/bottles-cxbrew"
    cellar :any
    sha256 "504d1af8fda5926434fc3045b1426e50f9e916bb764058773d1ef95c7084c43a" => :catalina
  end

  depends_on "cfitsio"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check" if build.with? "check"
    system "make", "install"
  end
end
