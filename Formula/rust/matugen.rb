class Matugen < Formula
  desc "Material You and base16 color generation tool with templates"
  homepage "https://github.com/InioX/matugen"
  url "https://github.com/InioX/matugen/archive/refs/tags/v4.1.0.tar.gz"
  sha256 "b46507be24d01a6233597077512501f21075fe4ce19b60b410354f439f569ddf"
  license "GPL-2.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # no-op: color generation requires image input
  end
end
