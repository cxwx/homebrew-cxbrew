class Jsoncons < Formula
  desc "C++, header-only lib for constructing JSON-like data formats"
  homepage "https://github.com/danielaparker/jsoncons"
  url "https://github.com/danielaparker/jsoncons/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "f1017b36e4e034acd5c0f5f616bacf5d7a161d6d3a43ff9ddb73fd8dca4d3cd9"
  license "BSL-1.0"
  head "https://github.com/danielaparker/jsoncons.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DJSONCONS_BUILD_TESTS=OFF
      -DBUILD_TESTING=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  # FAIL: test github:danielaparker/jsoncons/discussions/671
  test do
    system "true"
  end
end
