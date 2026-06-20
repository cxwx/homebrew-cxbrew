# cspell:disable
class Xtensorio < Formula
  desc "C++ library for reading/writing xtensor data formats"
  homepage "https://github.com/xtensor-stack/xtensor-io"
  url "https://github.com/xtensor-stack/xtensor-io/archive/refs/tags/0.14.0.tar.gz"
  sha256 "6aceb66e32a88eff58028443eacc1e73b6453d36c57eb4f2f13925356bbe5947"
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
