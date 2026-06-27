class EmmetLs < Formula
  desc "Emmet support based on LSP"
  homepage "https://github.com/aca/emmet-ls"
  url "https://registry.npmjs.org/emmet-ls/-/emmet-ls-0.4.2.tgz"
  sha256 "298838a63ff85cd6b0ad358dbca36a933a04b049a4030a9a21c64bb0ccd95a17"
  license "MIT"
  head "https://github.com/aca/emmet-ls.git", branch: "master"

  livecheck do
    url :stable
    strategy :npm
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    # emmet-ls 是 stdio LSP server，无 --version/--help；验证 binary 可执行。
    assert_predicate bin/"emmet-ls", :executable?
  end
end
