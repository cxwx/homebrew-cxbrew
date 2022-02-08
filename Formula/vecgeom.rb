class Vecgeom < Formula
  desc "Geometry modeller library needed by particle detector simulation"
  homepage "https://gitlab.cern.ch/VecGeom/VecGeom"
  url "https://gitlab.cern.ch/VecGeom/VecGeom/-/archive/v1.1.18/VecGeom-v1.1.18.tar.gz"

  depends_on "ccache" => :build
  depends_on "cmake" => :build
#  depends_on "root"
  depends_on "vc"

  def install
    mkdir "builddir" do
      args = std_cmake_args + %w[
        ../
        -DBACKEND=Vc
        -DNO_SPECIALIZATION=ON
        -DVc_DIR=/usr/local/lib/cmake/Vc/
      ]
      # -DROOT=ON
      # -DBUILD_SHARED_LIBS=ON
      system "cmake", *args
      system "make", "install"
    end
  end
end
