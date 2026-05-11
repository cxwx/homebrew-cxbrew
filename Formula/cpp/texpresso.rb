class Texpresso < Formula
  desc "Live rendering and error reporting for LaTeX"
  homepage "https://github.com/let-def/texpresso"
  url "https://github.com/let-def/texpresso/archive/refs/tags/v0.1.tar.gz"
  sha256 "fbf93759737bc08f1c96b34b0f94012d39d2ebc52910140fbd899f4a3daadadf"
  license "MIT"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "tectonic" => :build
  depends_on "mupdf"
  depends_on "sdl2"

  def install
    system "make", "config"
    system "make", "all"
    bin.install "build/texpresso", "build/texpresso-xetex"
  end

  test do
    assert_path_exists bin/"texpresso"
    assert_path_exists bin/"texpresso-xetex"
  end
end
