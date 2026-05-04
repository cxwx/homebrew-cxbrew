class Jsoncons < Formula
  desc "C++, header-only lib for constructing JSON-like data formats"
  homepage "https://github.com/danielaparker/jsoncons"
  url "https://github.com/danielaparker/jsoncons/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "5a2aad4e791a1c93b0b0b326973459753a96a4c48d06d3035cd0ea0d262198d4"
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

  test do
    system "echo", "hello"
  end
  # TODO: test github:danielaparker/jsoncons/discussions/671
end
