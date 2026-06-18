# cspell:disable
class Vecgeom < Formula
  desc "Geometry modeller library needed by particle detector simulation"
  homepage "https://gitlab.cern.ch/VecGeom/VecGeom"
  url "https://gitlab.cern.ch/VecGeom/VecGeom/-/archive/v2.0.0/VecGeom-v2.0.0.tar.gz"
  sha256 "509d26ffd95d517094d2fe97712a0a54ac0300bd943de3ae626bf4abeb1b6424"

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

  test do
  end
end
