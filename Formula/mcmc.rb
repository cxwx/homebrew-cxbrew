class Mcmc < Formula
  desc "Lightweight C++ library of MCMC methods"
  homepage "https://github.com/kthohr/mcmc.git"
  url "https://github.com/kthohr/mcmc.git",
    :revision => "9152d4ddc0a2d451fc1e4692b475a07e0094bd1d"
  head "https://github.com/kthohr/mcmc.git"
  version "0.0.1"
  license "Apache-2.0"

  depends_on "rsync" => :build
  depends_on "libomp"
  depends_on "openblas"
  depends_on "armadillo"

  def install
    if OS.mac?
      system "sed -i'.bak' 's/-fopenmp/-Xpreprocessor -fopenmp -lomp/g' configure"
      system "mkdir -p #{prefix}/lib"
    end
    system "./configure", "-p",
                          "-i #{prefix}"
    system "make"
    system "make install"
  end

  test do
    system "false"
  end
end
