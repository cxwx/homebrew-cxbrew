class Libsharp < Formula
  desc "Library for fast spherical harmonic transforms [healpix version]"
  homepage "https://github.com/Libsharp/libsharp"
#  url "https://github.com/Libsharp/libsharp/archive/v1.0.0.tar.gz"
  url "https://svwh.dl.sourceforge.net/project/healpix/Healpix_3.60/libsharp-1.0.0.tar.gz"
  sha256 "e98293315ee0f8a4c69c627bda36297b45e35e7afc33f510756f212d36c02f92"

  depends_on "pkg-config" => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

end
