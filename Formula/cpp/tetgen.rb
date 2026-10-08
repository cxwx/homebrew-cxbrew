class Tetgen < Formula
  desc "Quality Tetrahedral Mesh Generator and a 3D Delaunay Triangulator"
  homepage "https://wias-berlin.de/software/index.jsp?id=TetGen&lang=1"
  url "https://github.com/TetGen/TetGen/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "88398de3e0c16463f27686b73c7fc863df97360784466d22a24e0590886b16ec"
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
    lib.install "builddir/libtet.a"
    bin.install "builddir/tetgen"
  end
  test do
    system "true"
  end
end
