class CodeWhale < Formula
  desc "Terminal UI for DeepSeek AI"
  homepage "https://github.com/Hmbown/CodeWhale"
  url "https://github.com/Hmbown/CodeWhale/archive/refs/tags/v0.8.60.tar.gz"
  sha256 "a22588c97a9526c04b72d2372f0e4ecda4e1c9707e800c990cb42d67876ee9b3"
  license "MIT"
  head "https://github.com/Hmbown/CodeWhale.git", branch: "main"

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
