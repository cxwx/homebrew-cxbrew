class Pal < Formula
  homepage "https://github.com/IceCube-SPNO/pal"
  url "https://github.com/Starlink/pal/releases/download/v0.9.8/pal-0.9.8.tar.gz"
  version "0.9.8"
  sha256 "191fde8c4f45d6807d4b011511344014966bb46e44029a4481d070cd5e7cc697"

  depends_on "erfa"
  # batteries not included
  if RUBY_PLATFORM.match?(/darwin/)
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool"  => :build
  end

  def install
    #    system "autoreconf", "--install", "--symlink", buildpath
    system "./configure", "--disable-debug",
                          "--without-starlink",
                          #                          "--disable-dependency-tracking",
                          #                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
