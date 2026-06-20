# cspell:disable
class Xtensorio < Formula
  desc "C++ library for reading/writing xtensor data formats"
  homepage "https://github.com/xtensor-stack/xtensor-io"
  url "https://github.com/xtensor-stack/xtensor-io/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
