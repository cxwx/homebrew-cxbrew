class TimrTui < Formula
  desc "TUI to organize your time: Pomodoro, Countdown, Timer, Event"
  homepage "https://github.com/sectore/timr-tui"
  url "https://github.com/sectore/timr-tui/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "4c6ef2843b93469b357ebdc17b2edf18323234ee99807c649bdced998a9e6231"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"timr-tui", "--help"
  end
end
