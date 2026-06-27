class GdscriptFormatter < Formula
  desc "Faster code formatter for GDScript and Godot 4"
  homepage "https://github.com/GDQuest/GDScript-formatter"
  version "0.20.1"
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
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.20.1/gdscript-formatter-0.20.1-macos-aarch64.zip"
      sha256 "29d2f449fa3a1492adc9fc5de3411315f775a8d368e425be41a1a0d1d5dd7009"
    end
    on_intel do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.20.1/gdscript-formatter-0.20.1-macos-x86_64.zip"
      sha256 "c242d26badf6ecf550a4e2f4b29d164fb84da710ed1ab1a5471e98d64d5bda05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.20.1/gdscript-formatter-0.20.1-linux-aarch64.zip"
      sha256 "a7f68b97277f340cbacbd3f3c92eaf350aaa3851411072573032bba29409ce33"
    end
    on_intel do
      url "https://github.com/GDQuest/GDScript-formatter/releases/download/0.20.1/gdscript-formatter-0.20.1-linux-x86_64.zip"
      sha256 "8cd2a9e8520bc4d0f80a51bca8b3cb4295f9f4f21f7b09aec95a058271729077"
    end
  end

  def install
    bin.install Dir["gdscript-formatter-*"].first => "gdscript-formatter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gdscript-formatter --version")
  end
end
