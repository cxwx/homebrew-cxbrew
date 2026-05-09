class Args < Formula
  desc "Simple header-only C++ argument parser library"
  homepage "https://github.com/Taywee/args"
  url "https://github.com/Taywee/args/archive/refs/tags/6.4.16.tar.gz"
  sha256 "13fd2c21c4941672f02d67ac666fe6507fe2c2e0f17f95a0c2f17fddb4023000"
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
    system "false"
  end
end
