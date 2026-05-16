class MihomoTui < Formula
  desc "A simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "53b25bfa17b7f70f6f07cabf20effa3e20ad765c127839dc32459a09f8473574"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # no-op: TUI application requires terminal
  end
end
