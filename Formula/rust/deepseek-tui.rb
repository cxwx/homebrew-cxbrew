class DeepseekTui < Formula
  desc "Terminal UI for DeepSeek AI"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  url "https://github.com/Hmbown/DeepSeek-TUI/archive/refs/tags/v0.8.33.tar.gz"
  sha256 "dbd68af1944e12015dd71edae9b5da23ecb22af816ff3b987f6d079176daa78d"
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
    system "cargo", "install", *std_cargo_args(path: "crates/cli")
    system "cargo", "install", *std_cargo_args(path: "crates/tui")
  end

  test do
    system bin/"deepseek", "--version"
  end
end
