# cspell:disable
class Cubicinterpolation < Formula
  desc ""
  homepage "https://github.com/tudo-astroparticlephysics/cubic_interpolation"
  head "https://github.com/tudo-astroparticlephysics/cubic_interpolation.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "eigen"


  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
