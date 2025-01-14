# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Gomock < Formula
  desc "https://github.com/uber-go/mock"
  homepage "https://github.com/uber-go/mock"
  # url "https://github.com/uber-go/mock/archive/refs/tags/v0.5.0.tar.gz"
  # sha256 "41c16668926118ccfe8606e335487c0213efbb1330061e3ab7e97650b78e7737"
  head "https://github.com/uber-go/mock.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-s -w", "-o bin/mockgen"
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
