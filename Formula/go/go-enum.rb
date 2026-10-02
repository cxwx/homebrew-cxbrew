#                https://rubydoc.brew.sh/Formula
class GoEnum < Formula
  desc "Enum generator for go"
  homepage "https://github.com/abice/go-enum"
  url "https://github.com/abice/go-enum/archive/refs/tags/v0.9.5.tar.gz"
  sha256 "70818e5c177493c335124abb5c102038bf31b0a77fb53e546979fd8131378939"
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
