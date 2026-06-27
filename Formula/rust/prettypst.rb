class Prettypst < Formula
  desc "Formatter for Typst"
  homepage "https://github.com/antonWetzel/prettypst"
  url "https://github.com/antonWetzel/prettypst/archive/refs/tags/2.0.0.tar.gz"
  sha256 "8797c064f48364c3644d196a92946fdccc2d2d42d5e6333ddc129da725d910b3"
  license "MIT"
  head "https://github.com/antonWetzel/prettypst.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    output = pipe_output("#{bin}/prettypst --use-std-in --use-std-out", "#let x=1+2")
    assert_match "#let x = 1 + 2", output
  end
end
