class Dune < Formula
  desc "A customizable shell and scripting environment with aesthetic polish"
  homepage "https://github.com/adam-mcdaniel/dune"
  url "https://github.com/adam-mcdaniel/dune/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "f195352ed183b39cbbf638e580b399ce19bd2c49c4a51c31740dcca26c514f1f"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # no-op: interactive shell cannot be tested non-interactively
  end
end
