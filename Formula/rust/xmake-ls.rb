class XmakeLs < Formula
  desc "Language server for the XMake build system"
  homepage "https://github.com/CppCXY/xmake_ls"
  url "https://github.com/CppCXY/xmake_ls/archive/refs/tags/0.5.0.tar.gz"
  sha256 "f7b475cfcaa9e96ff225b173e309053c3edeecef87350253414624031449eab7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", "crates/xmake_ls", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"xmake_ls", "--version"
  end
end
