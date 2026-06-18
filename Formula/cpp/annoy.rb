class Annoy < Formula
  desc "Approximate Nearest Neighbors in C++/Python optimized for memory usage and loading/saving to disk"
  homepage "https://github.com/spotify/annoy"
  url "https://github.com/spotify/annoy/archive/refs/tags/v1.17.3.tar.gz"
  sha256 "c121d38cacd98f5103b24ca4e94ca097f18179eed3037e9eb93ad70ec1e6356e"
  head "https://github.com/spotify/annoy.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "make" => :build

  def install
    args = std_cmake_args

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
end
