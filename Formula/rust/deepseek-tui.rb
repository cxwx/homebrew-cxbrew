class DeepseekTui < Formula
  desc "Terminal UI for DeepSeek AI"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  url "https://github.com/Hmbown/DeepSeek-TUI/archive/refs/tags/v0.8.16.tar.gz"
  sha256 "2285c2e3f85ee361abef42ae123d7185ec89a81ee2c2f91fa8597d5562848797"
  license "MIT"
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
