class Crmc < Formula
  desc "Cosmic Ray Monte Carlo"
  homepage "https://devel-ik.fzk.de/wsvn/mc/crmc/"
  #  url "https://github.com/alisw/crmc/archive/v1.7.0.tar.gz"
  url "https://gitlab.ikp.kit.edu/AirShowerPhysics/crmc/-/archive/svn/crmc.v1.7.1/crmc-svn-crmc.v1.7.1.tar.gz"

  depends_on "cmake" => :build
  depends_on "gcc@9"
  # depends_on "gcc" # gcc 10 bug

  def install
    mkdir "../build" do
      args = %W[
        -DCMAKE_INSTALL_PREFIX=#{prefix}
        -DCMAKE_Fortran_COMPILER=/usr/local/bin/gfortran-9
        -D__CRMCSTATIC__=ON
      ]
      system "cmake", buildpath, *args
      system "make"
      system "make", "install"
    end
  end
end
