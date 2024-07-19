# cspell:disable
class Dealii < Formula
  desc "Deal II"
  homepage "www.dealii.org"
  # url "https://github.com/dealii/dealii/releases/download/v9.5.2/dealii-9.5.2.tar.gz"
  head "https://github.com/dealii/dealii", branch: "master"

  depends_on "cmake" => :build
  depends_on "vtk"
  depends_on "boost"
  depends_on "arpack"
  depends_on "assimp"
  depends_on "gmsh"
  depends_on "hdf5"
  depends_on "gsl"
  depends_on "gcc"
  depends_on "gfortran"
  depends_on "muparser"
  depends_on "opencascade"
  # depends_on "sundials" # bug
  depends_on "symengine"
  depends_on "cgal"
  depends_on "tbb"

  def install
    mkdir "./build" do
      args = %w[
        -DCMAKE_INSTALL_PREFIX="#{prefix}"
        -DDEAL_II_FORCE_BUNDLED_KOKKOS=OFF
        -DDEAL_II_WITH_KOKKOS=OFF
      ]
      system "cmake", buildpath, *args
      system "make"
      system "make", "install"
    end
  end
end
