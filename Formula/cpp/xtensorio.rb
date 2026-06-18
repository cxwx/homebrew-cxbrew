# cspell:disable
class Xtensorio < Formula
  desc "xtensor-io"
  homepage "https://github.com/xtensor-stack/xtensor-io"
  url "https://github.com/xtensor-stack/xtensor-io/archive/refs/tags/0.13.0.tar.gz"
  sha256 "470bedee082adb0ef25ef7b54f9cfd3684e27b8489c42cf7980e0d90c14d04da"
  head "https://github.com/xtensor-stack/xtensor-io.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "xtensor"
  depends_on "openimageio"
  depends_on "libsndfile"
  depends_on "filesystem"


  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix} -DHAVE_OIIO=ON -DHAVE_SndFile=ON -DHAVE_ZLIB=ON"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
