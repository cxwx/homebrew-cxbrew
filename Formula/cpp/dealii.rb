# cspell:disable
class Dealii < Formula
  desc "Deal.II finite element library"
  homepage "https://www.dealii.org"
  url "https://github.com/dealii/dealii/releases/download/v9.8.0/dealii-9.8.0.tar.gz"
  sha256 "d8d66aac57baad145a752d3f11cf72cfa9457e3f99ae09e5c8d5c9259a83aee1"
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
    args = %W[
      -B builddir
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}
    ]
    system "cmake", ".", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
    system "true"
  end
end
