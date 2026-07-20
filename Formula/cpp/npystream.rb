class Npystream < Formula
  desc "C++20 library for streaming data to .npy files"
  homepage "https://github.com/mreininghaus/npystream"
  url "https://github.com/mreininghaus/npystream/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "4e601cd99ad0c4304e9cba4e838421d72832631a6d016e5e659cfe1d0c5e99de"
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
    system "true"
  end
end
