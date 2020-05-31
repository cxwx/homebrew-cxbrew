class Geant4 < Formula
  desc "Simulation toolkit for particle transport through matter"
  homepage "https://geant4.web.cern.ch"
  url "http://geant4-data.web.cern.ch/geant4-data/releases/geant4.10.06.p02.tar.gz"
  version "10.6.2"
  sha256 "ecdadbf846807af8baa071f38104fb0dcc24847c8475cd8397302e2aefa8f66f"
  revision 1

  depends_on "cmake" => [:build, :test]
  depends_on "expat"
  depends_on "qt"
  depends_on "xerces-c"
  depends_on "boost-python3"
  depends_on "python@3.8"

  def install
    mkdir "geant-build" do
      args = std_cmake_args + %w[
        ../
        -DGEANT4_USE_GDML=ON
        -DGEANT4_USE_QT=ON
        -DGEANT4_USE_PYTHON=ON
        -DGEANT4_INSTALL_DATA=ON
      ]

      system "cmake", *args
      system "make", "install"
    end

  end

  def caveats
    <<~EOS
      Because Geant4 expects a set of environment variables for
      datafiles, you should source:
        . #{HOMEBREW_PREFIX}/bin/geant4.sh (or .csh)
      before running an application built with Geant4.
    EOS
  end

  test do
    system "cmake", share/"Geant4-#{version}/examples/basic/B1"
    system "make"
    (testpath/"test.sh").write <<~EOS
      . #{bin}/geant4.sh
      ./exampleB1 run2.mac
    EOS
    assert_match "Number of events processed : 1000",
                 shell_output("/bin/bash test.sh")
  end
end
