class OpenscadLsp < Formula
  desc "Language (LSP) server for OpenSCAD"
  homepage "https://github.com/Leathong/openscad-LSP"
  url "https://github.com/Leathong/openscad-LSP/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "bd8dadc5f9439b77d3f38be9c36a8e4ba13cf32d1844bdf84b7a5c2e543cbb85"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/Leathong/openscad-LSP.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_tags
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openscad-lsp --version")
  end
end
