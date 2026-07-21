# cspell:disable
class Filesystem < Formula
  desc "For xtensor-io"
  homepage "https://github.com/gulrak/filesystem"
  url "https://github.com/gulrak/filesystem/archive/refs/tags/v1.5.16.tar.gz"
  sha256 "f4a098ed48e3b25b87b2be84cde58c884177af6b4ce27666ed2dbfe907b24418"
  head "https://github.com/gulrak/filesystem.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    assert_path_exists include/"ghc/filesystem.hpp"
  end
end
