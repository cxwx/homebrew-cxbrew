# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Gomvp < Formula
  desc "gomvp lets you refactor/rename packages"
  homepage "https://github.com/abenz1267/gomvp"
  url "https://github.com/abenz1267/gomvp/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "3770dc26022cde4a12cf228c53b7dd38be80554825010f2ba44749018605ec21"
  head "https://github.com/abenz1267/gomvp.git", branch: "master"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    # output = pipe_output("#{bin}/goawk '{ gsub(/Macro/, \"Home\"); print }' -", "Macrobrew")
    # assert_equal "Homebrew", output.strip
  end
end
