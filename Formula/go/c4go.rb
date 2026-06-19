class C4go < Formula
  desc "Transpiling C code to Go code"
  homepage "https://github.com/Konstantin8105/c4go"
  license "MIT"
  head "https://github.com/Konstantin8105/c4go.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "true"
  end
end
