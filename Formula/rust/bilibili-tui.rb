class BilibiliTui < Formula
  desc "Terminal user interface (TUI) client for Bilibili"
  homepage "https://maredevi.moe/projects/bilibili-tui/"
  url "https://github.com/MareDevi/bilibili-tui/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "f6bd7bf097478406135310c66e8d590d61c0fde0535aeaa63c04c9fe255ba419"
  license "MIT"
  head "https://github.com/maredevi/bilibili-tui.git", branch: "main"

  depends_on "rust" => :build

  # native-tls pulls in openssl-sys on Linux; macOS uses the system Security framework.
  on_linux do
    depends_on "openssl@3"
  end

  def install
    ENV["OPENSSL_DIR"] = formula_opt_prefix("openssl@3") if OS.linux?
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system "true"
  end
end
