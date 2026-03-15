class RimeLs < Formula
  desc "A language server that provides input method functionality using librime"
  homepage "https://github.com/wlh320/rime-ls" 
  # url "https://github.com/wlh320/rime-ls/archive/refs/tags/v0.4.3.tar.gz"
  # TODO:此版本我记得有内存泄露的问题 github:wlh320/rime-ls/issues/74
  license "MIT"
  head "https://github.com/wlh320/rime-ls.git", branch: "master"

  depends_on "rust" => :build
  depends_on "librime"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"rime-ls", "--version"
  end
end
