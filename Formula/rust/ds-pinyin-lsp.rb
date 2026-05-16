class DsPinyinLsp < Formula
  desc "Dead Simple Pinyin language server for inputting Chinese in code"
  homepage "https://github.com/iamcco/ds-pinyin-lsp"
  url "https://github.com/iamcco/ds-pinyin-lsp/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "87226ed8206d62cfbf84012023f43daa0d9bbbcd273d98abd91fd5a70f4207d7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", "packages/ds-pinyin-lsp", "--locked", "--root", prefix.to_s
  end

  test do
    # no-op: LSP server cannot be tested non-interactively
  end
end
