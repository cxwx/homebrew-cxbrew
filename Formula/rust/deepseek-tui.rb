class DeepseekTui < Formula
  desc "Terminal UI for DeepSeek AI"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  url "https://github.com/Hmbown/DeepSeek-TUI/archive/refs/tags/v0.8.14.tar.gz"
  sha256 "00504c54ceb3212d849ba6e5f1aa4971ebd7bdb0b3dd959971e6265a90add522"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end
  head "https://github.com/Hmbown/DeepSeek-TUI.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cli")
    system "cargo", "install", *std_cargo_args(path: "crates/tui")
  end

  test do
    system bin/"deepseek", "--version"
  end
end
