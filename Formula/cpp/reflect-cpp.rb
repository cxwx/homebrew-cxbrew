class ReflectCpp < Formula
  desc "C++20 lib for fast serialization deserialization validation using reflection"
  homepage "https://github.com/getml/reflect-cpp"
  url "https://github.com/getml/reflect-cpp/archive/refs/tags/v0.24.0.tar.gz"
  sha256 "2185d45cca58f60bcdaca37a995c6f8e90c0105f312610333fed75f2efa6a996"
  head "https://github.com/getml/reflect-cpp.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "make" => :build
  depends_on "apache-arrow"
  depends_on "avro-c"
  depends_on "capnp"
  depends_on "ctre"
  depends_on "flatbuffers"
  depends_on "jsoncons"
  depends_on "mongo-c-driver"
  depends_on "msgpack-c" # https://capnproto.org/ # bson
  depends_on "nlohmann-json"
  depends_on "pugixml"
  depends_on "rapidjson"
  depends_on "simdjson" # cxwx
  depends_on "toml11"
  depends_on "tomlplusplus"
  depends_on "yaml-cpp"
  depends_on "yyjson" # ?

  # BUG: janssonConfig.cmake not installed, avro=off
  # BUG: arrow::arrow  but the target was not found csv=off
  # BUG: bson-1.0Config mongo-c-driver bson=off
  def install
    args = std_cmake_args + %w[
      -DCMAKE_MAKE_PROGRAM=gmake
      -DREFLECTCPP_BUILD_SHARED=ON
      -DREFLECTCPP_BSON=OFF
      -DREFLECTCPP_CAPNPROTO=ON
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

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
    echo "hello"
  end
end
