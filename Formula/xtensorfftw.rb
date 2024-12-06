# cspell:disable
class Xtensorfftw < Formula
  desc "xtensor-fftw"
  homepage "https://github.com/xtensor-stack/xtensor-fftw"
  head "https://github.com/xtensor-stack/xtensor-fftw.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "xtensor"
  depends_on "fftw"
  # depends_on "xtl" already in xtensor


  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
