class Airshipper < Formula
  desc "Official launcher for the Veloren voxel RPG"
  homepage "https://veloren.net/download"
  url "https://github.com/veloren/airshipper/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "fb4628a4c1b5f8ab8b1a8523c30af3b3eff05c1611a995e8b265c547bbfddafe"
  license "GPL-3.0-only"
  head "https://github.com/veloren/airshipper.git", branch: "master"

  # 最新 tag 为 v0.17.0，但上游 GitHub release 仍停在 v0.14.0（新 tag 无发布资产），
  # 故按 tag 取版本而非 :github_latest。
  livecheck do
    url :stable
    strategy :github_tags
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  # iced (winit + wgpu) GUI: Linux 需 X11/字体/Vulkan 系统库；macOS 走系统框架无需额外依赖。
  # 上游 flake.nix 另含 alsa/udev，但客户端不引用音频/手柄，故省略。
  on_linux do
    depends_on "pkg-config" => :build
    depends_on "fontconfig"
    depends_on "freetype"
    depends_on "libx11"
    depends_on "libxcb"
    depends_on "libxcursor"
    depends_on "libxi"
    depends_on "libxkbcommon"
    depends_on "libxrandr"
    depends_on "mesa"
    depends_on "vulkan-loader"
  end

  def install
    # workspace 成员 client（启动器）/ server；仅构建客户端二进制 airshipper。
    system "cargo", "install", "--path", "client", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"airshipper", "--help"
  end
end
