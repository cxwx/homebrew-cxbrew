class SystemdLsp < Formula
  desc "Language Server Protocol server for systemd unit files"
  homepage "https://github.com/JFryy/systemd-lsp"
  url "https://github.com/JFryy/systemd-lsp/archive/refs/tags/v2026.04.21.tar.gz"
  version "2026.04.21"
  sha256 "278887e63cda60502069504d9175b35664a246692191e4d4ada9f43404c51864"
  license "MIT"
  head "https://github.com/JFryy/systemd-lsp.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    assert_match "systemd-lsp", shell_output("#{bin}/systemd-lsp --help")
  end
end
