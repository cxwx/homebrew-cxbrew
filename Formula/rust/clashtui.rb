class Clashtui < Formula
  desc "Mihomo (Clash.Meta) / sing-box TUI Client"
  homepage "https://github.com/JohanChane/clashtui"
  url "https://github.com/JohanChane/clashtui/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "3b13a7d232d4f2344faf8b73c6540182d0030e4a806ed6ba748eac739978d8a4"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix.to_s, "--path", "."
  end

  test do
    system bin/"clashtui", "--version"
  end
end
