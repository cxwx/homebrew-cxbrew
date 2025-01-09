# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Args < Formula
  desc "  A simple header-only C++ argument parser library. Supposed to be flexible and powerful, and attempts to be compatible with the functionality of the Python standard argparse library (though not necessarily the API)."
  homepage "https://github.com/Taywee/args"
  url "https://github.com/Taywee/args/archive/refs/tags/6.4.6.tar.gz"
  sha256 "41ed136bf9b216bf5f18b1de2a8d22a870381657e8427d6621918520b6e2239c"
  head "https://github.com/Taywee/args.git", branch: "master"
  license "MIT"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
      -DARGS_BUILD_EXAMPLE=OFF
      -DARGS_BUILD_UNITTESTS=OFF
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    system "false"
  end
end
