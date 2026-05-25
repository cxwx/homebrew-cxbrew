class MihomoTui < Formula
  desc "A simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "38946c7c45a7451c8be405e0f49cfcc89bb66ff8e0268378e16ac020667a8e05"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    # no-op: TUI application requires terminal
  end
end
