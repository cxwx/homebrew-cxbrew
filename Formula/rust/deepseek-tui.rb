class DeepseekTui < Formula
  desc "Terminal UI for DeepSeek AI"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  url "https://github.com/Hmbown/DeepSeek-TUI/archive/refs/tags/v0.8.7.tar.gz"
  sha256 "55403e3be36270be6ad14d9c4bf8a2c6aebf384474d9225fd7e28e0b181fb1e0"
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
