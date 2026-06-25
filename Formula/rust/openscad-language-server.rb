class OpenscadLanguageServer < Formula
  desc "Language Server Protocol server for OpenSCAD"
  homepage "https://github.com/dzhu/openscad-language-server"
  url "https://github.com/dzhu/openscad-language-server/archive/refs/tags/0.1.0.tar.gz"
  sha256 "a35c5099e720f052a3dc9c2a8b8d6eaf735ad33f295ff5d75e0b9f6f7200424f"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/dzhu/openscad-language-server.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_tags
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # TODO: drive the stdio LSP server with an initialize/shutdown handshake.
    assert_predicate bin/"openscad-language-server", :executable?
  end
end
