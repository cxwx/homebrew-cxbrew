# cspell:disable
class Csv2 < Formula
  desc "Fast CSV parser and writer for Modern C++"
  homepage "https://github.com/p-ranav/csv2"
  url "https://github.com/p-ranav/csv2/archive/refs/tags/v0.2.tar.gz"
  sha256 "30e9ac5e83520475a274ec04494ad24d602a15bb75839610b51432e50a98048d"
  head "https://github.com/p-ranav/csv2.git", branch: "main"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    assert_path_exists include/"csv2/reader.hpp"
  end
end
