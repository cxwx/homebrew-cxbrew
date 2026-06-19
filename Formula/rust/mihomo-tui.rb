class MihomoTui < Formula
  desc "Simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "d5a27d4028a4099e182b010ea7471df61aa8b4a6759fde7016ff216f2c54b86a"
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
