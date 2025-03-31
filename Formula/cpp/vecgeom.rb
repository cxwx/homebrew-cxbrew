# cspell:disable
class Vecgeom < Formula
  desc "Geometry modeller library needed by particle detector simulation"
  homepage "https://gitlab.cern.ch/VecGeom/VecGeom"
  url "https://gitlab.cern.ch/VecGeom/VecGeom/-/archive/v01.02.10/VecGeom-v01.02.10.tar.gz"
  sha256 "b9c839d4a0788491598b6510dc7cd1cb4d14618bafb5e0bd3066c28364930221"

  depends_on "cmake" => :build
  depends_on "vc"
  depends_on "veccore"
  depends_on "xerces-c"

  def install
    args = %w[
      ../
      -DVECGEOM_GDML=ON
      -DVECGEOM_FAST_MATH=ON
      -DVECGEOM_SANITIZER=ON
      -DBUILD_SHARED_LIBS=ON
    ]
    # static not worked
    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
end
