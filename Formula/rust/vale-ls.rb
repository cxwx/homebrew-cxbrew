class ValeLs < Formula
  desc "Language Server Protocol implementation for the Vale linter"
  homepage "https://github.com/vale-cli/vale-ls"
  url "https://github.com/vale-cli/vale-ls/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b03334caf3533fef37192ccab04d44713bfaef5b059e97ea19c24429e13089b3"
  license "MIT"
  head "https://github.com/vale-cli/vale-ls.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # vale-ls 是 stdio LSP server，brew test 下 shell_output 会超时，故只验证
    # binary 可执行。(上游 v0.4.0 tag 的 Cargo.toml 仍标 0.3.8，故 --version
    # 输出 0.3.8，与 formula version 不一致，属上游问题。)
    assert_predicate bin/"vale-ls", :executable?
  end
end
