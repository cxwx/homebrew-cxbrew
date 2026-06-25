class DotLanguageServer < Formula
  desc "Language server for the DOT language"
  homepage "https://github.com/nikeee/dot-language-server"
  url "https://registry.npmjs.org/dot-language-server/-/dot-language-server-3.1.0.tgz"
  sha256 "7e54c278c6256b8074c11a850d7565c0b0575bec81794f27f7010788ad89b386"
  license "MIT"
  head "https://github.com/nikeee/dot-language-server.git", branch: "master"

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
    assert_match version.to_s, shell_output("#{bin}/dot-language-server --version")
  end
end
