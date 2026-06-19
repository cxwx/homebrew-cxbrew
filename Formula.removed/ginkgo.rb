# frozen_string_literal: true

class Ginkgo < Formula
  desc "Modern Testing Framework for Go"
  homepage "https://onsi.github.io/ginkgo/"
  url "https://github.com/onsi/ginkgo/archive/refs/tags/v2.28.3.tar.gz"
  sha256 "82b6626efa55beff70398ee71bd0ef18546eac548369294f77730e07243058a0"
  license "MIT"
  head "https://github.com/onsi/ginkgo.git", branch: "master"

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
