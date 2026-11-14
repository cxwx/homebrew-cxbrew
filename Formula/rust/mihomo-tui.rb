class MihomoTui < Formula
  desc "Simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "d9591929b872fc3cfec8912e440f9713701bd1a883dced94b53ac0e05ae9b07c"
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
