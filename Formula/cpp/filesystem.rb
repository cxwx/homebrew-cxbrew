# cspell:disable
class Filesystem < Formula
  desc "filesystem for xtensor-io"
  homepage "https://github.com/gulrak/filesystem"
  head "https://github.com/gulrak/filesystem.git", branch: "master"

  depends_on "cmake" => :build


  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
