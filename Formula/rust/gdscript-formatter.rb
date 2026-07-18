class GdscriptFormatter < Formula
  desc "Faster code formatter for GDScript and Godot 4"
  homepage "https://github.com/GDQuest/GDScript-formatter"
  version "0.21.0"
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
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.21.0/gdscript-formatter-0.21.0-macos-aarch64.zip"
      sha256 "441bbf3de76ed8e74e7dd57515557300aa7f426ef1d1be7a7f6db25b2235edc1"
    end
    on_intel do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.21.0/gdscript-formatter-0.21.0-macos-x86_64.zip"
      sha256 "e663f789c6077d128386abb5c167d08824da9a95b65af267c0d931e280622137"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.21.0/gdscript-formatter-0.21.0-linux-aarch64.zip"
      sha256 "9252daf30c0687a448cd0b8c78ded618ba7af4e12c3d62d9cae3b174990e7b0b"
    end
    on_intel do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.21.0/gdscript-formatter-0.21.0-linux-x86_64.zip"
      sha256 "dcf4aa93e3a20abdbfebb673b7d2fbdc3320f6a0e6e651ab46c85f326cb653d1"
    end
  end

  def install
    bin.install Dir["gdscript-formatter-*"].first => "gdscript-formatter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gdscript-formatter --version")
  end
end
