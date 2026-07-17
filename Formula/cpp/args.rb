class Args < Formula
  desc "Simple header-only C++ argument parser library"
  homepage "https://github.com/Taywee/args"
  url "https://github.com/Taywee/args/archive/refs/tags/6.5.0.tar.gz"
  sha256 "c2b05d582783b20160966c5a9136fbd704d9c910deb3bec38c8cae46138de53f"
  license "MIT"
  head "https://github.com/Taywee/args.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
      -DARGS_BUILD_EXAMPLE=OFF
      -DARGS_BUILD_UNITTESTS=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    system "true"
  end
end
