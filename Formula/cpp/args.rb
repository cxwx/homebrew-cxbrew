class Args < Formula
  desc "Simple header-only C++ argument parser library"
  homepage "https://github.com/Taywee/args"
  url "https://github.com/Taywee/args/archive/refs/tags/6.6.0.tar.gz"
  sha256 "9949b763e4b43ad3362d5da365e7f6118df296bc29c1d2dff415baac1e430c43"
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
