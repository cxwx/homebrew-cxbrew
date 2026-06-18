class Primitive < Formula
  desc "Reproducing images with geometric primitives"
  homepage "https://github.com/fogleman/primitive"
  license "MIT"
  head "https://github.com/fogleman/primitive.git", branch: "master"

  depends_on "go" => :build
  depends_on "imagemagick" => :optional

  def install
    # Project predates Go modules; initialize go.mod
    ENV["GOPROXY"] = "https://goproxy.cn,https://proxy.golang.org,direct"
    system "go", "mod", "init", "github.com/fogleman/primitive"
    system "go", "mod", "tidy"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "Usage", shell_output("#{bin}/primitive 2>&1", 1)
  end
end
