class Pal < Formula
  homepage "https://github.com/IceCube-SPNO/pal"
  # url "https://github.com/Starlink/pal/releases/download/v0.9.8/pal-0.9.8.tar.gz"
#  url "https://github.com/Starlink/pal/releases/download/v0.9.10/pal-0.9.10.tar.gz"
#  sha256 "191fde8c4f45d6807d4b011511344014966bb46e44029a4481d070cd5e7cc697"
  head "https://github.com/cxwx/pal.git", using: :git, branch: "master"
#  version "0.9.10"

  depends_on "erfa"
  # if RUBY_PLATFORM.match?(/darwin/)
  #   depends_on "autoconf" => :build
  #   depends_on "automake" => :build
  #   depends_on "libtool"  => :build
  # end
  depends_on "cmake" => :build

  # def install
  #   #    system "autoreconf", "--install", "--symlink", buildpath
  #   # system "autoreconf" "--fiv"
  #   system "./configure", "--disable-debug",
  #                         "--without-starlink",
  #                         #                          "--disable-dependency-tracking",
  #                         #                          "--disable-silent-rules",
  #                         "--prefix=#{prefix}"
  #   system "make", "install"
  # end
  def install
    args = %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
end
