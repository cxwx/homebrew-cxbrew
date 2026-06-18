# cspell:disable
class Filesystem < Formula
  desc "filesystem for xtensor-io"
  homepage "https://github.com/gulrak/filesystem"
  url "https://github.com/gulrak/filesystem/archive/refs/tags/v1.5.14.tar.gz"
  sha256 "e783f672e49de7c5a237a0cea905ed51012da55c04fbacab397161976efc8472"
  head "https://github.com/gulrak/filesystem.git", branch: "master"

  depends_on "cmake" => :build


  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
