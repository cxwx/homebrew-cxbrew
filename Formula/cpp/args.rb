class Args < Formula
  desc "Simple header-only C++ argument parser library"
  homepage "https://github.com/Taywee/args"
  url "https://github.com/Taywee/args/archive/refs/tags/6.6.1.tar.gz"
  sha256 "61cdbb13f55493e6ffe07018c86b17f9ff68a5c1059eb15f4f079e04429915ff"
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
