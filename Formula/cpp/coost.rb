# cspell:disable
class Coost < Formula
  desc "Tiny boost library in C++11"
  homepage "https://github.com/idealvin/coost"
  url "https://github.com/idealvin/coost/archive/refs/tags/v4.0.1.tar.gz"
  sha256 "4b8fad3283f5c5c12f6ca54da2da772c8e128cb471a56ac42729a6cbdddd0093"
  head "https://github.com/idealvin/coost.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "openssl"

  def install
    args = std_cmake_args + %w[
      -DFPIC=ON
      -DBUILD_SHARED_LIBS=ON
      -DWITH_LIBCURL=ON
      -DWITH_OPENSSL=ON
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    system "true"
  end
end
