class Gorename < Formula
  desc "No decs"
  homepage "https://github.com/amitbet/gorename"
  head "https://github.com/amitbet/gorename.git", branch: "master"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "false"
  end
end
