class TimrTui < Formula
  desc "TUI to organize your time: Pomodoro, Countdown, Timer, Event"
  homepage "https://github.com/sectore/timr-tui"
  url "https://github.com/sectore/timr-tui/archive/refs/tags/v1.11.1.tar.gz"
  sha256 "fe28b52a65da8a7bebdc3a60a8d1693afd997482d9b936b2b3105184ee38994d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"timr-tui", "--help"
  end
end
