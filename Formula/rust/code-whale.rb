class CodeWhale < Formula
  desc "Terminal UI for DeepSeek AI"
  homepage "https://github.com/Hmbown/CodeWhale"
  url "https://github.com/Hmbown/CodeWhale/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "a56796e3309c65830bd1cabb7f012abbcade048d25c4515ccd0fb8a8576efcf7"
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
