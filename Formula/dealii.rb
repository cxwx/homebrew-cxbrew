# cspell:disable
class Dealii < Formula
  desc "Deal.II finite element library"
  homepage "https://www.dealii.org"
  url "https://github.com/dealii/dealii/releases/download/v9.5.2/dealii-9.5.2.tar.gz"
  sha256 "7930e5218a9807d60cc05c300a3b70f36f4af22c3551a2cd1141fbab013bbaf1"
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
