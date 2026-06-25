class AwkLanguageServer < Formula
  desc "Language Server Protocol implementation for AWK"
  homepage "https://github.com/Beaglefoot/awk-language-server"
  url "https://registry.npmjs.org/awk-language-server/-/awk-language-server-0.10.6.tgz"
  sha256 "254c12fefe25453846313318fcd5f7b00dcef46568bb02c065a65248a77d3e11"
  license "MIT"
  head "https://github.com/Beaglefoot/awk-language-server.git", branch: "master"

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
    assert_match version.to_s, shell_output("#{bin}/awk-language-server --version")
  end
end
