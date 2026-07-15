class BilibiliTui < Formula
  desc "Terminal user interface (TUI) client for Bilibili"
  homepage "https://maredevi.moe/projects/bilibili-tui/"
  url "https://github.com/MareDevi/bilibili-tui/archive/refs/tags/v1.0.12.tar.gz"
  sha256 "1aa58265043f67e866221affb4c18ac198018a90c58c9bc71891fb796d1f4eb2"
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
