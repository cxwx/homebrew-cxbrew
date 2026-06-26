class TimrTui < Formula
  desc "TUI to organize your time: Pomodoro, Countdown, Timer, Event"
  homepage "https://github.com/sectore/timr-tui"
  url "https://github.com/sectore/timr-tui/archive/refs/tags/v1.11.0.tar.gz"
  sha256 "e22bf84587cbc09bb04579dc7323954538c5da61ffa4bb21b06dce30feeab42b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"timr-tui", "--help"
  end
end
