class Coin < Formula
  desc "Deal.II finite element library"
  homepage "https://www.dealii.org"
  url "https://github.com/dealii/dealii/releases/download/v9.6.2/dealii-9.6.2.tar.gz"
  sha256 "1051e332de3822488e91c2b0460681052a3c4c5ac261cdd7a6af784869a25523"
  license "Apache-2.0"
  head "https://github.com/dealii/dealii.git", branch: "master"

  # The dependency 'sundials' is commented out due to a bug

  depends_on "cmake" => :build
  depends_on "arpack"
  depends_on "assimp"
  depends_on "boost"
  depends_on "cgal"
  depends_on "gcc" # fortran
  depends_on "gmsh"
  depends_on "gsl"
  depends_on "hdf5"
  depends_on "muparser"
  depends_on "opencascade"
  depends_on "symengine"
  depends_on "tbb"
  depends_on "vtk"
  depends_on :xcode

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
    system "echo", "not finished"
  end
end
