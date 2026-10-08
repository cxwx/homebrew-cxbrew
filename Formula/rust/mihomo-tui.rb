class MihomoTui < Formula
  desc "Simple TUI dashboard for monitoring and managing Mihomo via its REST API"
  homepage "https://github.com/potoo0/mihomo-tui"
  url "https://github.com/potoo0/mihomo-tui/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "bbcbf38fac8e11a18d9ca8acd96481eab07200c083647cb6fbf6883853ee7b0d"
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
