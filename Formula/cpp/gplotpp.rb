class Gplotpp < Formula
  desc "Header-only C++ library that interfaces with Gnuplot"
  homepage "https://github.com/ziotom78/gplotpp"
  url "https://github.com/ziotom78/gplotpp/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "5d6d411abfd6283ace3aa9f41a34d2cdccad5ceed21d486d2a64318a974d9661"
  head "https://github.com/ziotom78/gplotpp.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DGPLOTPP_BUILD_EXAMPLES=OFF",
           "-DGPLOTPP_ENABLE_TESTS=OFF",
           *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_path_exists include/"gplot++.h"
  end
end
