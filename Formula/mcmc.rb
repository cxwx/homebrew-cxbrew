class Mcmc < Formula
  desc "Lightweight C++ library of MCMC methods"
  homepage "https://github.com/kthohr/mcmc"
  url "https://github.com/kthohr/mcmc.git",
    revision: "9152d4ddc0a2d451fc1e4692b475a07e0094bd1d"
  version "0.0.1"
  license "Apache-2.0"
  head "https://github.com/kthohr/mcmc.git"

  depends_on "rsync" => :build
  depends_on "armadillo"
  depends_on "libomp"
  depends_on "openblas"

  def install
    if OS.mac?
      system "sed", "-i.bak", "s/-fopenmp/-Xpreprocessor -fopenmp -lomp/g", "configure"
      system "mkdir", "-p", "#{prefix}/lib"
    end
    system "./configure", "-p",
                          "-i #{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
