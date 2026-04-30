class Gplotpp < Formula
  desc "A header-only C++ library that interfaces with Gnuplot"
  homepage "https://github.com/ziotom78/gplotpp"
  head "https://github.com/ziotom78/gplotpp.git", branch: "master"

  def install
    include.install "gplot++.h"
  end
end
