class TimrTui < Formula
  desc "TUI to organize your time: Pomodoro, Countdown, Timer, Event"
  homepage "https://github.com/sectore/timr-tui"
  url "https://github.com/sectore/timr-tui/archive/refs/tags/v1.12.0.tar.gz"
  sha256 "582e87eddfb6e8ce6ea75c366fe46165f650459c487f9ac06f96261f681acd04"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"timr-tui", "--help"
  end
end
