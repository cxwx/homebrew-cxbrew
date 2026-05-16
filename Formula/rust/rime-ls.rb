class RimeLs < Formula
  desc "Language server that provides input method functionality using librime"
  homepage "https://github.com/wlh320/rime-ls"
  url "https://github.com/wlh320/rime-ls/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "38a13b1ba9cbf833a0d96c12a0b4cc38c8feb73d6efbd3c4002e498ab29a3d2b"
  license "MIT"
  head "https://github.com/wlh320/rime-ls.git", branch: "master"

  depends_on "rust" => :build
  depends_on "librime"

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"rime-ls", "--version"
  end
end
