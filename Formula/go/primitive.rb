class Primitive < Formula
  desc "Reproducing images with geometric primitives"
  homepage "https://github.com/fogleman/primitive"
  url "https://github.com/fogleman/primitive/archive/refs/heads/master.tar.gz"
  version "0.0.1"
  sha256 "63a749395b2297d48ff7aff19f7fd211b0cefffae72c1a4c90745023044f4679"
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
