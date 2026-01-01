class ReflectCpp < Formula
  desc "A C++20 library for fast serialization, deserialization and validation using reflection."
  homepage "https://github.com/getml/reflect-cpp"
  url "https://github.com/getml/reflect-cpp/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "9c5650d7ef0ab2b0ff617095280c641e6d770d9efc62dc04d86bb6ea56b55130"
  # sha256 "08b6406cbe4c6c14ff1a619fe93a94f92f6d9eb22213d93529ad975993945e45"
  head "https://github.com/getml/reflect-cpp.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "make" => :build
  # depends_on "vcpkg" => :build
  # TODO: add support: from vcpkg
  depends_on "tomlplusplus"
  depends_on "toml11"
  depends_on "yaml-cpp"
  depends_on "rapidjson"
  depends_on "nlohmann-json"
  depends_on "msgpack-c"
  depends_on "flatbuffers"
  depends_on "ctre"
  # depends_on "capnproto" # not found https://capnproto.org/
  depends_on "mongo-c-driver"  # bson
  depends_on "simdjson"
  # depends_on "gtest"
  # depends_on "benchmark"
  # depends_on "arrow"
  depends_on "apache-arrow" # ??
  depends_on "jsoncons" # cxwx/homebrew github:danielaparker/jsoncons
  depends_on "pugixml"
  depends_on "yyjson" # ?
  depends_on "avro-c"

  # BUG: janssonConfig.cmake not installed, avro=off
  # BUG: arrow::arrow  but the target was not found csv=off
  # BUG: bson-1.0Config mongo-c-driver bson=off
  def install
    args = std_cmake_args + %w[
      -DCMAKE_MAKE_PROGRAM=gmake
      -DREFLECTCPP_BUILD_SHARED=ON
      -DREFLECTCPP_BSON=OFF
      -DREFLECTCPP_CBOR=ON
      -DREFLECTCPP_UBJSON=ON
      -DREFLECTCPP_JSON=ON
      -DREFLECTCPP_YAML=ON
      -DREFLECTCPP_USE_VCPKG=OFF
      -DREFLECTCPP_TOML=ON
      -DREFLECTCPP_XML=ON
      -DREFLECTCPP_AVRO=OFF
      -DREFLECTCPP_CSV=OFF
      -DREFLECTCPP_FLEXBUFFERS=ON
      -DREFLECTCPP_MSGPACK=ON
      -DREFLECTCPP_PARQUET=OFF
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
