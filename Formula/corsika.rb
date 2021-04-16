class Corsika < Formula
  desc "Simulation toolkit for Cosmic ray air shower [ver 8]"
  homepage "https://www.ikp.kit.edu/corsika/"
  url "https://gitlab.ikp.kit.edu/AirShowerPhysics/corsika/-/archive/master/corsika-master.tar.gz"
  version "8.0.0"

  # sha256 "5e4ff5bbdf6f533c448de1ccc6642c43313030bfc2fcabd3df762672cb7a17c8"

  depends_on "cmake" => [:build, :test]
  depends_on "eigen"
  depends_on "gcc" # for gfortran
  depends_on "pythia"

  def install
    mkdir "corsika-build" do
      args = std_cmake_args + %w[
        ../
        -DWITH_EIGEN3=ON
        -DWITH_EIGEN3_LOWER=ON
        -DWITH_PYTHIA=ON
        -DCMAKE_BUILD_TYPE=Release
      ]

      system "cmake", *args
      system "make", "install"
    end
  end

  def caveats
    <<~EOS
      put
      export FC=/usr/local/bin/fortran#{" "}
      before brew install corsika
    EOS
  end
end
