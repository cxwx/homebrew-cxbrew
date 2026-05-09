class Gplotpp < Formula
  desc "Header-only C++ library that interfaces with Gnuplot"
  homepage "https://github.com/ziotom78/gplotpp"
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
