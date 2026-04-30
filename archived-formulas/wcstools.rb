class Wcstools < Formula
  desc "Tools for using World Coordinate Systems (WCS) in astronomical images"
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.7.tar.gz"
  sha256 "525f6970eb818f822db75c1526b3122b1af078affa572dce303de37df5c7b088"
  license "GPL-2.0-or-later"

  def install
    inreplace "Makefile" do |s|
      cflags = s.get_make_var("CFLAGS").split
      cflags.delete("-g")
      cflags.each { |flag| ENV.append_to_cflags flag }
      s.change_make_var!("CFLAGS", ENV.cflags)
    end

    bin.mkpath
    system "make", "BIN=#{bin}", "all"
    bin.install "wcstools"
    man1.install buildpath.glob("man/man1/*.1")
  end

  test do
    assert_match "IMHEAD", shell_output("#{bin}/imhead 2>&1", 1)
  end
end
