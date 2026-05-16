class BilibiliTui < Formula
  desc "A terminal user interface (TUI) client for Bilibili"
  homepage "https://maredevi.moe/projects/bilibili-tui/"
  url "https://github.com/MareDevi/bilibili-tui/archive/refs/tags/v1.0.11.tar.gz"
  sha256 "906a98ec336a25d5eb340d01583fede545eea31c9d32bd65c61f35c86b34c632"
  license "MIT"
  head "https://github.com/maredevi/bilibili-tui.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # system bin/"bilibili-tui"
  end
end
