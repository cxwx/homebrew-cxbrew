class Tetgen < Formula
  desc "Quality Tetrahedral Mesh Generator and a 3D Delaunay Triangulator"
  homepage "https://wias-berlin.de/software/index.jsp?id=TetGen&lang=1"
  url "https://github.com/TetGen/TetGen/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "524bddc38afc205db075b74b67da424b87e676cfd12eccf7915d2e945afcac10"
  license "AGPL-3.0-only"

  depends_on "cmake" => :build

  # FAIL: shared, cmake
  def install
    args = %w[
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
      -DBUILD_SHARED_LIBS=ON
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    # system "cmake", "--install", "builddir"
    lib.install "builddir/libtet.a"
    bin.install "builddir/tetgen"
  end
  test do
  end
end
