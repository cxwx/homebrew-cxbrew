class Squawk < Formula
  desc "Linter for Postgres migrations & SQL"
  homepage "https://github.com/sbdchd/squawk"
  url "https://github.com/sbdchd/squawk/archive/refs/tags/v2.59.0.tar.gz"
  sha256 "93f193fba40290482c11e1b8b39692140c580547c18969d5123760b0739a3300"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/sbdchd/squawk.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  # native-tls pulls in openssl-sys on Linux; macOS uses the system Security framework.
  on_linux do
    depends_on "openssl@3"
  end

  def install
    ENV["OPENSSL_DIR"] = formula_opt_prefix("openssl@3") if OS.linux?
    system "cargo", "install", "--path", "crates/squawk", "--locked", "--root", prefix.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/squawk --version")
  end
end
