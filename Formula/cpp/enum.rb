class Enum < Formula
  desc "C++ compile-time enum to string, iteration, in a single header file"
  homepage "https://github.com/aantron/better-enums"
  url "https://github.com/aantron/better-enums/archive/refs/tags/0.11.3.tar.gz"
  sha256 "1b1597f0aa5452b971a94ab13d8de3b59cce17d9c43c8081aa62f42b3376df96"
  head "https://github.com/aantron/better-enums.git", branch: "master"

  def install
    include.install "enum.h"
  end

  test do
    assert_path_exists include/"enum.h"
  end
end
