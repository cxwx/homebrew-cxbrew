class Corsika < Formula
  desc "Simulation toolkit for Cosmic ray air shower [CORSIKA]"
  homepage "https://gitlab.ikp.kit.edu/AirShowerPhysics/corsika"
#  url "https://gitlab.ikp.kit.edu/AirShowerPhysics/corsika/-/archive/master/corsika-master.tar.gz"
#  url "https://gitlab.ikp.kit.edu/AirShowerPhysics/corsika/-/archive/master/corsika-master.tar.gz"
#  version "8.0.0m2"
  head "https://gitlab.ikp.kit.edu/AirShowerPhysics/corsika/", :using => :git

  # sha256 "5e4ff5bbdf6f533c448de1ccc6642c43313030bfc2fcabd3df762672cb7a17c8"

  depends_on "cmake" => [:build, :test]
  depends_on "conan"
  depends_on "gcc" # for gfortran
  depends_on "python@3.9"
  depends_on "git" => [:build]
  depends_on "doxygen" => [:build]
  depends_on "graphviz" => [:build]
  depends_on "binutils" => [:build]
  depends_on "make" => [:build]

  def install
    mkdir "corsika-build" do
      args = std_cmake_args + %w[
        ../
        -DCMAKE_BUILD_TYPE=Release
      ]

      system "cmake", *args
      system "make", "install"
    end
  end

  def caveats
    <<~EOS
      put
      # export FC=/usr/local/bin/fortran#{" "}
      # export CORSIKA_DATA=$PWD/../corsika/modules/data
      export CORSIKA_DATA=[where your corsika data in]
      # corsika will install lib by conan in ~/.conan
    EOS
  end
end
