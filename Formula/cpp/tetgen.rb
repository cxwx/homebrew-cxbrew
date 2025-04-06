class Tetgen < Formula
  desc "Quality Tetrahedral Mesh Generator and a 3D Delaunay Triangulator"
  homepage "https://wias-berlin.de/software/index.jsp?id=TetGen&lang=1"
  url "https://wias-berlin.de/software/tetgen/1.5/src/tetgen1.6.0.tar.gz"
  sha256 "87b5e61ebd3a471fc4f2cdd7124c2b11dd6639f4feb1f941a5d2f5110d05ce39"
  license "GNU Affero Public License v. 3.0"

  depends_on "cmake" => :build

  # TODO: shared, cmake
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
    system "echo", "not finished"
  end
end
