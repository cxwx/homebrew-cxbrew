class Vecgeom < Formula
  desc "A geometry modeller library needed by particle detector simulation"
  homepage "https://gitlab.cern.ch/VecGeom/VecGeom"
  url "https://gitlab.cern.ch/VecGeom/VecGeom/-/archive/v1.1.7/VecGeom-v1.1.7.tar.gz"

  depends_on "cmake" => :build
  depends_on "ccache" => :build
  depends_on "vc"
  depends_on "root"

  def install
    mkdir "builddir" do
      args = std_cmake_args + %w[
        ../
        -DROOT=ON
        -DBACKEND=Vc
        -DNO_SPECIALIZATION=ON
        -DVc_DIR=/usr/local/lib/cmake/Vc/
      ]
      # -DBUILD_SHARED_LIBS=ON
      system "cmake", *args
      system "make", "install"
    end
  end

end
