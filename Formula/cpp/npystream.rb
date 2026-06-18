class Npystream < Formula
  desc "C++20 library for streaming data to .npy files"
  homepage "https://github.com/mreininghaus/npystream"
  url "https://github.com/mreininghaus/npystream/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "622e741fcf17047476092941bbb0821c31f0b7a0ba8687e0be2d5f41287cd14a"
  license "EUPL-1.2"
  head "https://github.com/mreininghaus/npystream.git", branch: "master"

  # The dependency 'sundials' is commented out due to a bug

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "builddir",
      "-DCMAKE_INSTALL_PREFIX=#{prefix}",
      "-DBUILD_SHARED_LIBS=ON",
      "-DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
  end
end
