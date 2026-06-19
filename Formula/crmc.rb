class Crmc < Formula
  desc "Cosmic Ray Monte Carlo"
  homepage "https://gitlab.iap.kit.edu/AirShowerPhysics/crmc"
  url "https://gitlab.iap.kit.edu/AirShowerPhysics/crmc/-/archive/v2.2.1_QGSJET_EXTEND_MASS_RANGE_v0/crmc-v2.2.1_QGSJET_EXTEND_MASS_RANGE_v0.tar.gz"
  sha256 "b8d6a6c2b22b2fc3df71f858c75b65a19914fdc6d0ca37e78a6017f1c5c62689"

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

  test do
    system "true"
  end
end
