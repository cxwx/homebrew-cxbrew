class C4go < Formula
  desc "Transpiling C code to Go code"
  homepage "https://github.com/Konstantin8105/c4go"
  head "https://github.com/Konstantin8105/c4go.git", branch: "master"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = pipe_output("#{bin}/goawk '{ gsub(/Macro/, \"Home\"); print }' -", "Macrobrew")
    assert_equal "Homebrew", output.strip
  end
end
