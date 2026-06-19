#                https://rubydoc.brew.sh/Formula
class GoEnum < Formula
  desc "Enum generator for go"
  homepage "https://github.com/abice/go-enum"
  url "https://github.com/abice/go-enum/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "56e6758ebb7721900565fbe9cc7159c760ae726b5e7fa19fe39ac91ed6da381a"
  license "MIT"
  head "https://github.com/abice/go-enum.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "true"
  end
end
