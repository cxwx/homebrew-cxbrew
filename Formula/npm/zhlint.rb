class Zhlint < Formula
  desc "Linting tool for Chinese language"
  homepage "https://github.com/zhlint-project/zhlint"
  url "https://registry.npmjs.org/zhlint/-/zhlint-0.8.2.tgz"
  sha256 "f96e28eec3b72840d0c1ef55a16639c5da04971dee11048dddbdeb86ec40c248"
  license "MIT"
  head "https://github.com/zhlint-project/zhlint.git", branch: "main"

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
    (testpath/"test.md").write("自动在中文和English之间加入空格")
    output = shell_output("#{bin}/zhlint test.md 2>&1", 1)
    assert_match "中英文内容之间需要一个空格", output
  end
end
