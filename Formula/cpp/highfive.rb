class Highfive < Formula
  desc "C++ wrapper for the HDF5 library"
  homepage "https://github.com/highfive-devs/highfive"
  url "https://github.com/highfive-devs/highfive/archive/refs/tags/v3.3.0.tar.gz"
  sha256 "325cfbcf0c0296a6dd26f3b088801b7ebb8d6f109c0565c11d2d8c4af3253bff"
  head "https://github.com/highfive-devs/highfive.git", branch: "main"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DHIGHFIVE_UNIT_TESTS=OFF"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    system "true"
  end
end
