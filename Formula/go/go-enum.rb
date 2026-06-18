# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class GoEnum < Formula
  desc "An enum generator for go"
  homepage "https://github.com/abice/go-enum"
  url "https://github.com/abice/go-enum/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "56e6758ebb7721900565fbe9cc7159c760ae726b5e7fa19fe39ac91ed6da381a"
  head "https://github.com/abice/go-enum.git", branch: "master"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
  end
end
