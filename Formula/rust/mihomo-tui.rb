class MihomoTui < Formula
  desc "A simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "35a40c9604a7a5638b822d1b48d631d3c933277d789e994bd622f44ce9de05ed"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # no-op: TUI application requires terminal
  end
end
