class Sqls < Formula
  desc "SQL language server written in Go"
  homepage "https://github.com/sqls-server/sqls"
  url "https://github.com/sqls-server/sqls/archive/refs/tags/v0.2.48.tar.gz"
  sha256 "dd8a27fc0ed440807969968ae4d6f9fa650c3bf6a827c1e69b70ec361b6657fc"
  license "MIT"
  head "https://github.com/sqls-server/sqls.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_tags
  end

  depends_on "go" => :build

  def install
    ENV["GOPROXY"] = "https://goproxy.cn,https://proxy.golang.org,direct"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqls --version")
  end
end
