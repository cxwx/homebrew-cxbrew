class PomodoroTui < Formula
  desc "Pomodoro timer with a terminal user interface"
  homepage "https://github.com/xamcost/pomodoro"
  url "https://github.com/xamcost/pomodoro/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "24f067ff196124cd6a60d51dd34d24d19f5bdbd1c498d99e5a9b21658b9c1404"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"pomodoro-tui", "--help"
  end
end
