require "formula"

class Pal < Formula

  homepage "https://github.com/IceCube-SPNO/pal"
  version "0.9.7"
  url "https://github.com/IceCube-SPNO/pal/archive/master.tar.gz"
  sha256 "001c4225d90a6887e8a7da45d1db2147bfa3c8ca3545492b20594042f9fcdabe"

  depends_on "erfa"
  # batteries not included
  if (RUBY_PLATFORM =~ /darwin/)
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool"  => :build
  end

  def install
    system "autoreconf", "--install", "--symlink", buildpath
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

end
