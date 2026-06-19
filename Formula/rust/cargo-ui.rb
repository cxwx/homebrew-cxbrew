class CargoUi < Formula
  desc "GUI for cargo built with the Slint framework"
  homepage "https://github.com/slint-ui/cargo-ui"
  url "https://github.com/slint-ui/cargo-ui/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "79693f5d7bbb2e51c853e295eb5a69673a4ffc109589c6b1637db44563db26d1"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system "true"
  end
end
