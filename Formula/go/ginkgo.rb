# Documentation: https://docs.brew.sh/Formula-Cookbook
# TODO: bug need add chmod +x
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ginkgo < Formula
  desc "A Modern Testing Framework for Go"
  homepage "http://onsi.github.io/ginkgo/"
  url "https://github.com/onsi/ginkgo/archive/refs/tags/v2.22.2.tar.gz"
  sha256 "1eb96d9ee728e225e683b590d08c632a60ad15f8ed815baa0f17f3ea4f136467"
  head "https://github.com/onsi/ginkgo.git", branch: "master"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ginkgo`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
