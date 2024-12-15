# cspell:disable
class Vecgeom < Formula
  desc "Geometry modeller library needed by particle detector simulation"
  homepage "https://gitlab.cern.ch/VecGeom/VecGeom"
  url "https://gitlab.cern.ch/VecGeom/VecGeom/-/archive/v01.02.10/VecGeom-v01.02.10.tar.gz"

  depends_on "cmake" => :build
  depends_on "vc"
  depends_on "veccore"
  depends_on "xerces-c"

  def install
    mkdir "builddir" do
      args = std_cmake_args + %w[
        ../
        -DVECGEOM_GDML=ON
      ]
      # -DROOT=ON
      # -DBUILD_SHARED_LIBS=ON
      system "cmake", *args
      system "make", "install"
    end
  end
end
