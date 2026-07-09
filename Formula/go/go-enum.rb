#                https://rubydoc.brew.sh/Formula
class GoEnum < Formula
  desc "Enum generator for go"
  homepage "https://github.com/abice/go-enum"
  url "https://github.com/abice/go-enum/archive/refs/tags/v0.9.3.tar.gz"
  sha256 "17d5e7f15c2fb9011377ee22633d1f679356f5eaeba27df2ba32623414ffffb6"
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
