class Mesonlsp < Formula
  desc "Unofficial language server for the Meson build system"
  homepage "https://github.com/JCWasmx86/mesonlsp"
  license "GPL-3.0-only"
  head "https://github.com/JCWasmx86/mesonlsp.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/JCWasmx86/mesonlsp/releases/download/v5.0.3/mesonlsp-aarch64-apple-darwin.zip"
      sha256 "230430a572f4d9aadcb77a58572f95b4369a9cb458451f9a3684ef0b025bdc49"
    end
    on_intel do
      url "https://github.com/JCWasmx86/mesonlsp/releases/download/v5.0.3/mesonlsp-x86_64-apple-darwin.zip"
      sha256 "b6c961732e8f40d3db9521ab3269d7589db6c51b8463bb3259d56f85663b9bf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JCWasmx86/mesonlsp/releases/download/v5.0.3/mesonlsp-aarch64-unknown-linux-musl.zip"
      sha256 "c0ae170b7378328d077005098a24c4d3841d5f87b4d2cf07d5afa741668fdbd4"
    end
    on_intel do
      url "https://github.com/JCWasmx86/mesonlsp/releases/download/v5.0.3/mesonlsp-x86_64-unknown-linux-musl.zip"
      sha256 "9984b3afc97e62163e2d83ff2c59bf69e259e2efc19b56931fdd6e2a55f1e830"
    end
  end

  def install
    bin.install "mesonlsp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mesonlsp --version")
  end
end
