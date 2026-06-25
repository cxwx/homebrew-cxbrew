class VimLanguageServer < Formula
  desc "Language Server Protocol implementation for Vim script"
  homepage "https://github.com/iamcco/vim-language-server"
  url "https://registry.npmjs.org/vim-language-server/-/vim-language-server-2.3.1.tgz"
  sha256 "ffe0d18258a4b09bec46ec853f8838748c007c62c1fcf12d1eefedfaf19e1c46"
  license "MIT"
  head "https://github.com/iamcco/vim-language-server.git", branch: "master"

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
    # The server speaks LSP over stdio and has no --version flag. Without a
    # transport flag it exits with a clear message instead of blocking, which
    # makes a deterministic smoke test.
    output = shell_output("#{bin}/vim-language-server 2>&1", 1)
    assert_match "Connection input stream is not set", output
  end
end
