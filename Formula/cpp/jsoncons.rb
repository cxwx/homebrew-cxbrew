class Jsoncons < Formula
  desc "A C++, header-only library for constructing JSON and JSON-like data formats, with JSON Pointer, JSON Patch, JSON Schema, JSONPath, JMESPath, CSV, MessagePack, CBOR, BSON, UBJSON"
  homepage "https://github.com/danielaparker/jsoncons"
  url "https://github.com/danielaparker/jsoncons/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "956021e44e50639be766a4ad71aff9a95168da188005fc6bfa23ee5d6a53eb32"
  license "Boost Software License"
  head "https://github.com/danielaparker/jsoncons.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DJSONCONS_BUILD_TESTS=OFF
      -DBUILD_TESTING=OFF
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
