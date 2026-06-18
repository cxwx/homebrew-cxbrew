# cspell:disable
class CppDump < Formula
  desc "A C++ library for debugging purposes that can print any variable, even user-defined types."
  homepage "https://github.com/philip82148/cpp-dump"
  url "https://github.com/philip82148/cpp-dump/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "b27a0854a405aa10619f341f66e26a6c39dca1ad41a26dd4fa6d86ad6752c4f8"
  head "https://github.com/philip82148/cpp-dump.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end


  test do
    assert_path_exists include/"cpp-dump.hpp"
  end
end
