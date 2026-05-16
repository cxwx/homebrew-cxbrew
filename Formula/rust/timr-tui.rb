class TimrTui < Formula
  desc "TUI to organize your time: Pomodoro, Countdown, Timer, Event"
  homepage "https://github.com/sectore/timr-tui"
  url "https://github.com/sectore/timr-tui/archive/refs/tags/v1.8.1.tar.gz"
  sha256 "3c3c2f5ccf98195ed48ace69abe925077abc2353fc8c601cbb5b08f0d8ad518a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"timr-tui", "--help"
  end
end
