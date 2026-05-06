class Crmc < Formula
  desc "Cosmic Ray Monte Carlo"
  homepage "https://devel-ik.fzk.de/wsvn/mc/crmc/"
  # url "https://gitlab.ikp.kit.edu/AirShowerPhysics/crmc/-/archive/svn/crmc.v1.7.1/crmc-svn-crmc.v1.7.1.tar.gz"
  # url "https://gitlab.ikp.kit.edu/AirShowerPhysics/crmc/-/archive/crmc.v1.8.0/crmc-crmc.v1.8.0.tar.gz"
  # url "https://gitlab.iap.kit.edu/AirShowerPhysics/crmc/-/archive/v2.2.1/crmc-v2.2.1.tar.gz"
  url "https://gitlab.iap.kit.edu/AirShowerPhysics/crmc/-/archive/v2.2.1_QGSJET_EXTEND_MASS_RANGE_v0/crmc-v2.2.1_QGSJET_EXTEND_MASS_RANGE_v0.tar.gz"

  depends_on "cmake" => :build
  depends_on "gcc"

  def install
    mkdir "../build" do
      args = %W[
        -DCMAKE_INSTALL_PREFIX=#{prefix}
        -DCMAKE_Fortran_COMPILER=/usr/local/bin/gfortran
        -D__CRMCSTATIC__=ON
      ]
      system "cmake", buildpath, *args
      system "make"
      system "make", "install"
    end
  end
end
