class MihomoTui < Formula
  desc "A simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "f7136a87f8578df695ecc7088d68b8af7472067c6a146734c607facbd0b8057b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # no-op: TUI application requires terminal
  end
end
