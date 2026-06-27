class Squawk < Formula
  desc "Linter for Postgres migrations & SQL"
  homepage "https://github.com/sbdchd/squawk"
  url "https://github.com/sbdchd/squawk/archive/refs/tags/v2.58.0.tar.gz"
  sha256 "b3e13bd2f6e2cde6e6c97d73f5d86b72a158ad4621546e3c3b52090342e8f707"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/sbdchd/squawk.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", "crates/squawk", "--locked", "--root", prefix.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/squawk --version")
  end
end
