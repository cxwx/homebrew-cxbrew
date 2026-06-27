class MihomoTui < Formula
  desc "Simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "23bed9989ebdf93d06c1514737b9582a5382ca9b1916c4d3e6cf7f0fcde1c553"
  license "MIT"

  depends_on "rust" => :build

  def install
    ENV.append_to_rustflags "--cfg tokio_unstable"
    ENV["VERGEN_GIT_DESCRIBE"] = "v#{version}"
    ENV["VERGEN_BUILD_DATE"] = time.iso8601
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system "true"
  end
end
