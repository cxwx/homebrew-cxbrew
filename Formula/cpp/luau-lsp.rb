class LuauLsp < Formula
  desc "Language Server Implementation for Luau"
  homepage "https://github.com/JohnnyMorganz/luau-lsp"
  version "1.69.0"
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
      url "https://github.com/JohnnyMorganz/luau-lsp/releases/download/1.69.0/luau-lsp-macos.zip"
      sha256 "4e93204901d892b227a4de15c9d4742176c15e9461d208cadafa1bcd58ec1ae3"
    end
    on_intel do
      url "https://github.com/JohnnyMorganz/luau-lsp/releases/download/1.69.0/luau-lsp-macos.zip"
      sha256 "4e93204901d892b227a4de15c9d4742176c15e9461d208cadafa1bcd58ec1ae3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JohnnyMorganz/luau-lsp/releases/download/1.69.0/luau-lsp-linux-arm64.zip"
      sha256 "b0c78fe40defe71b9fa6381390a590f2040897980a0cf31f0a23c165ad27ebbb"
    end
    on_intel do
      url "https://github.com/JohnnyMorganz/luau-lsp/releases/download/1.69.0/luau-lsp-linux-x86_64.zip"
      sha256 "4457aeb690d3c22e04567f38c6259ac259a1673ec022758b9cb81af2a0e66c41"
    end
  end

  def install
    bin.install "luau-lsp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/luau-lsp --version")
  end
end
