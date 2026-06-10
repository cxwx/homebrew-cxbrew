class CodeWhale < Formula
  desc "Terminal UI for DeepSeek AI"
  homepage "https://github.com/Hmbown/CodeWhale"
  url "https://github.com/Hmbown/CodeWhale/archive/refs/tags/v0.8.57.tar.gz"
  sha256 "51bac234d38684332b789f518e87c9ed0e6252e5ed945bfefdae7731610cdf65"
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
