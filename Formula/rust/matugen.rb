class Matugen < Formula
  desc "Material You and base16 color generation tool with templates"
  homepage "https://github.com/InioX/matugen"
  url "https://github.com/InioX/matugen/archive/refs/tags/v4.2.0.tar.gz"
  sha256 "82044ab8ac3e793b2b94f8f75917b348b4038585133a77c07f5de59c88d65244"
  license "GPL-2.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system "true"
  end
end
