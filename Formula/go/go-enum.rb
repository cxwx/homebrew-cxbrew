#                https://rubydoc.brew.sh/Formula
class GoEnum < Formula
  desc "Enum generator for go"
  homepage "https://github.com/abice/go-enum"
  url "https://github.com/abice/go-enum/archive/refs/tags/v0.9.4.tar.gz"
  sha256 "1c622c1f0b1fc982eed87a17598ed3e8fe84431566db6ee3d587096f8e6b3363"
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
