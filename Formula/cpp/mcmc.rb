class Mcmc < Formula
  desc "Lightweight C++ library of MCMC methods"
  homepage "https://github.com/kthohr/mcmc"
  head "https://github.com/kthohr/mcmc.git", branch: "master"

  depends_on "rsync" => :build
  depends_on "armadillo"
  depends_on "eigen"
  depends_on "libomp"
  depends_on "openblas"

  def install
    if OS.mac?
      system "sed", "-i.bak", "s/-fopenmp/-Xpreprocessor -fopenmp -lomp/g", "configure"
      system "mkdir", "-p", "#{prefix}/lib"
    end
    # system "export EIGEN_INCLUDE_PATH=/opt/homebrew/include/eigen3/"
    system "EIGEN_INCLUDE_PATH=/opt/homebrew/include/eigen3 ./configure -i #{prefix} -l eigen -p"
    # system "ARMA_INCLUDE_PATH=/opt/homebrew/include/armadillo ./configure -i #{prefix} -l amra -p"
    system "make"
    system "make", "install"
  end

end
