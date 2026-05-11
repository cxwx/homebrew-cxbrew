class XmakeLs < Formula
  desc "Language server for the XMake build system"
  homepage "https://github.com/CppCXY/xmake_ls"
  url "https://github.com/CppCXY/xmake_ls/archive/refs/tags/0.3.0.tar.gz"
  sha256 "1c056025bd56717dc7350823a6cb21b4513a2fbc9f65d9d7efa47cd654ded8b8"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/xmake_ls")
  end

  test do
    system bin/"xmake_ls", "--version"
  end
end
