class Squawk < Formula
  desc "Linter for Postgres migrations & SQL"
  homepage "https://github.com/sbdchd/squawk"
  url "https://github.com/sbdchd/squawk/archive/refs/tags/v2.63.0.tar.gz"
  sha256 "6f2e64594c1eec898234063d51f996a302c7a088374f102a40dcde396bb93f75"
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
