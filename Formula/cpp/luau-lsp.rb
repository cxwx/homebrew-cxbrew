class LuauLsp < Formula
  desc "Language Server Implementation for Luau"
  homepage "https://github.com/JohnnyMorganz/luau-lsp"
  version "1.68.1"
  license "MIT"

  # 上游把 Luau 作为 git submodule，GitHub source archive 不含 submodule，
  # 源码构建复杂；改用官方 release 的预编译 binary (macOS 为 universal)。
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    # macOS release 是 universal binary (x86_64 + arm64)，on_arm/on_intel 共用。
    on_arm do
      url "https://github.com/JohnnyMorganz/luau-lsp/releases/download/1.68.1/luau-lsp-macos.zip"
      sha256 "e32a71823ee47471d931a03e4186ced2b4c43bb785c8fe05de901fe54c6ebe21"
    end
    on_intel do
      url "https://github.com/JohnnyMorganz/luau-lsp/releases/download/1.68.1/luau-lsp-macos.zip"
      sha256 "e32a71823ee47471d931a03e4186ced2b4c43bb785c8fe05de901fe54c6ebe21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JohnnyMorganz/luau-lsp/releases/download/1.68.1/luau-lsp-linux-arm64.zip"
      sha256 "4ab4906dee6041ec23a8b0abdd81c1fdbd770c8c2dcb931e39a33f6790d779f3"
    end
    on_intel do
      url "https://github.com/JohnnyMorganz/luau-lsp/releases/download/1.68.1/luau-lsp-linux-x86_64.zip"
      sha256 "ddb5fe8fd503bbcb76ee439fbd6522efbfe9f0098be5a233401e493c579fc4a9"
    end
  end

  def install
    bin.install "luau-lsp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/luau-lsp --version")
  end
end
