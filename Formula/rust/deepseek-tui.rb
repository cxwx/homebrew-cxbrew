class DeepseekTui < Formula
  desc "Terminal UI for DeepSeek AI"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  url "https://github.com/Hmbown/DeepSeek-TUI/archive/refs/tags/v0.8.44.tar.gz"
  sha256 "e63995e37bb7b2a6b9b27e7c7ea74fd54e69cbf8277f03f0611eb1732b260f2e"
  license "MIT"
  head "https://github.com/Hmbown/DeepSeek-TUI.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build
  on_linux do
    depends_on "dbus" => :build
  end

  def install
    system "cargo", "install", "--path", "crates/cli", "--locked", "--root", prefix.to_s
    system "cargo", "install", "--path", "crates/tui", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"deepseek", "--version"
  end
end
