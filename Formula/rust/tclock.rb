class Tclock < Formula
  desc "Simple, aesthetic, and resource-efficient terminal clock"
  homepage "https://github.com/ChristophePRAT/tclock"
  url "https://github.com/ChristophePRAT/tclock/archive/740ae7311c62356b3490ae2ebb821bafe8c5a481.tar.gz"
  version "0.1.0"
  sha256 "e0e8a31799df510ce58bab38acf00941f64802e475baa8e0dbf7b595e1bf2e06"
  license "MIT"
  head "https://github.com/ChristophePRAT/tclock.git", branch: "main"

  # 上游尚无 git tag/release，故 url 锁定到最新提交；version 取自 Cargo.toml。
  livecheck do
    skip "No upstream releases yet"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    system bin/"tclock", "--help"
  end
end
