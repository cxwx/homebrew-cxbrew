# cspell:disable
class Xtensorio < Formula
  desc "C++ library for reading/writing xtensor data formats"
  homepage "https://github.com/xtensor-stack/xtensor-io"
  url "https://github.com/xtensor-stack/xtensor-io/archive/refs/tags/0.15.0.tar.gz"
  sha256 "8de6bbf58f79dce1ce56da6d79ac01d0f4110aa45d69ca39f40c1f557b55d488"
  head "https://github.com/xtensor-stack/xtensor-io.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "filesystem"
  depends_on "libsndfile"
  depends_on "openimageio"
  depends_on "xtensor"

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DHAVE_OIIO=ON", "-DHAVE_SndFile=ON",
"-DHAVE_ZLIB=ON"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    system "true"
  end
end
