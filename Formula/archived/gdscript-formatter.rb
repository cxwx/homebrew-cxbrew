class GdscriptFormatter < Formula
  desc "Faster code formatter for GDScript and Godot 4"
  homepage "https://github.com/GDQuest/GDScript-formatter"
  version "0.24.0"
  license "MIT"

  # 上游 .gitattributes 用 `export-ignore` 让 GitHub source archive 只含 Godot
  # 插件 (addons/)、排除 Rust 源码；crates.io 也未发布。故用官方 release 的
  # 预编译 binary (上游用 Rust 构建，故归类在 rust/)。
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.24.0/gdscript-formatter-0.24.0-macos-aarch64.zip"
      sha256 "22a2ea7a527f11a790853fe9490baf9542fc951169c801a46a66f24e4aebaab1"
    end
    on_intel do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.24.0/gdscript-formatter-0.24.0-macos-x86_64.zip"
      sha256 "33e2e6f7cb62e6bf6cb73552e761813984195f47929137e18d1af4af49a771c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.24.0/gdscript-formatter-0.24.0-linux-aarch64.zip"
      sha256 "b646ce2f8fa04d8e3703b3d9bee6b083101cc6ee8c7299b5bd7f635a9b25f537"
    end
    on_intel do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.24.0/gdscript-formatter-0.24.0-linux-x86_64.zip"
      sha256 "1e277d61a21fc858d0c4ff61d061e62ee3dce04e858fa57601deaf088789c509"
    end
  end

  def install
    bin.install Dir["gdscript-formatter-*"].first => "gdscript-formatter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gdscript-formatter --version")
  end
end
