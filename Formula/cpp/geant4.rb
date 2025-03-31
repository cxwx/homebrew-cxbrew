class Geant4 < Formula
  desc "Simulation toolkit for particle transport through matter"
  homepage "https://geant4.web.cern.ch"
  url "https://geant4-data.web.cern.ch/releases/geant4-v11.3.0.tar.gz"

  depends_on "cmake" => [:build, :test]
  depends_on "expat"
  depends_on "qt"    # DONE: qt5 -> qt6
#  depends_on "vtk"  # TODO: 目前似乎显示有BUG
  depends_on "xerces-c"

  # conflicts_with "geant4", because: "both install `geant4`" # TODO:check the brew-sci

  def install
    mkdir "geant-build" do
      args = std_cmake_args + %w[
        ../
        -DGEANT4_USE_GDML=ON
        -DGEANT4_USE_QT=ON
        -DGEANT4_USE_QT_QT6=ON
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

  # TODO: test
  # test do
  #   system "cmake", share/"Geant4-#{version}/examples/basic/B1"
  #   system "make"
  #   (testpath/"test.sh").write <<~EOS
  #     . #{bin}/geant4.sh
  #     ./exampleB1 run2.mac
  #   EOS
  #   assert_match "Number of events processed : 1000",
  #                shell_output("/bin/bash test.sh")
  # end
end
