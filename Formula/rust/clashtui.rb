class Clashtui < Formula
  desc "Mihomo (Clash.Meta) / sing-box TUI Client"
  homepage "https://github.com/JohanChane/clashtui"
  url "https://github.com/JohanChane/clashtui/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "c3cff217705732ef98fc7ada2aedc60cb22632373ad686d1ded12951dc9e6f6f"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix.to_s, "--path", "."
  end

  test do
    system bin/"clashtui", "--version"
  end
end
