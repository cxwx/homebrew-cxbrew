class Cadmesh < Formula
  desc "CAD file interface for GEANT4"
  homepage "https://github.com/christopherpoole/CADMesh"
  url "https://github.com/christopherpoole/CADMesh/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "fc0765fc984b32a7b7b6687bb84a57b3d1c0c1db8991a651b3443b4971e48c01"
  head "https://github.com/christopherpoole/CADMesh.git", branch: "master"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "tetgen" => :build
  depends_on "geant4" # FAIL:

  def install
    args = %w[
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    ]

    # system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    # system "cmake", "--build", "builddir"
    # system "cmake", "--install", "builddir"
  end
  test do
    system "echo", "not finished"
  end
end
