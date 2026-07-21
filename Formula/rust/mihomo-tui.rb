class MihomoTui < Formula
  desc "Simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "4681a0a91e6e6247e74c69f30b60d25771ddf772ee7c43e9c4cb06be72797a8b"
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
