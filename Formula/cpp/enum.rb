class Enum < Formula
  desc "C++ compile-time enum to string, iteration, in a single header file"
  homepage "https://github.com/aantron/better-enums"
  head "https://github.com/aantron/better-enums.git", branch: "master"

  def install
    include.install "enum.h"
  end
end
