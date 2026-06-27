class Fixjson < Formula
  desc "JSON fixer for humans using (relaxed) JSON5"
  homepage "https://github.com/rhysd/fixjson"
  url "https://registry.npmjs.org/fixjson/-/fixjson-1.1.2.tgz"
  sha256 "28bcae94ecfbe7495f778066216946fd1858c1ff612981f4f3d6fa12a884c879"
  license "MIT"
  head "https://github.com/rhysd/fixjson.git", branch: "master"

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
    (testpath/"test.json").write('{"name": "test", "value": 1,}')
    output = shell_output("#{bin}/fixjson test.json")
    assert_match '"name": "test"', output
  end
end
