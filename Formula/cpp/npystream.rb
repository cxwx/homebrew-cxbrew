class Npystream < Formula
  desc "C++20 library for streaming data to .npy files"
  homepage "https://github.com/mreininghaus/npystream"
  url "https://github.com/mreininghaus/npystream/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "22ec98e0781ce0edc7886e1449847ee6c29bc09e3c7b436f95f2909848ba34df"
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
