class Geant4 < Formula
  desc "Simulation toolkit for particle transport through matter"
  homepage "https://geant4.web.cern.ch"
  url "https://github.com/Geant4/geant4/archive/refs/tags/v11.4.2.tar.gz"
  sha256 "f381f461e31fdcfccf28a5e48b420d61ba66adbf55d266e3691277bab04eb270"
  head "https://github.com/Geant4/geant4.git", branch: "master"

  depends_on "cmake" => [:build, :test]
  depends_on "freetype"
  depends_on "qt"
  depends_on "xerces-c"

  def install
    mkdir "geant-build" do
      args = std_cmake_args + %w[
        ../
        -DGEANT4_USE_GDML=ON
        -DGEANT4_USE_QT=ON
        -DGEANT4_INSTALL_DATA=ON
        -DGEANT4_INSTALL_DATA_TIMEOUT=3000
        -DGEANT4_USE_QT_QT6=ON
        -DGEANT4_USE_FREETYPE=ON
        -DBUILD_SHARED_LIBS=ON
        -DBUILD_STATIC_LIBS=OFF
        -DGEANT4_USE_VTK=OFF
        -DGEANT4_INSTALL_DATA=ON
        -DGEANT4_BUILD_MULTITHREADED=ON
        -DGEANT4_BUILD_TLS_MODEL=global-dynamic
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
