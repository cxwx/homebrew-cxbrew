# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libsharp2 < Formula
  desc "Library for fast spherical harmonic transforms"
  homepage "https://gitlab.mpcdf.mpg.de/mtr/libsharp"
  url "https://github.com/cxwx/libsharp2/archive/v0.0.1.tar.gz"
  sha256 "f9b31f685ee4af64724e5aa34c61a7186669b29bf9987aec2612dcc9e4aa6250"

  depends_on "autoconf" => :install
  depends_on "automake" => :install
  depends_on "libtool" => :install

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    #
    system "autoreconf -i" 
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libsharp2`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
