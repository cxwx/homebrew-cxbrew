# cspell:disable
class Cubicinterpolation < Formula
  desc ""
  homepage "https://github.com/tudo-astroparticlephysics/cubic_interpolation"
  url "https://github.com/tudo-astroparticlephysics/cubic_interpolation/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "fc34de15c9dd9e651728c9e0eee5528ee9636e41a3d8aa6f41735018810afd59"
  head "https://github.com/tudo-astroparticlephysics/cubic_interpolation.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "eigen"


  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end


  test do
    system "true"
  end
end
