# cspell:disable
class Coost < Formula
  desc "Tiny boost library in C++11"
  homepage "https://github.com/idealvin/coost"
  url "https://github.com/idealvin/coost/archive/refs/tags/v3.0.2.tar.gz"
  sha256 "922ba21fb9a922c84f6a4b3bd568ed3b3463ccb1ae906cd7c49d90c7f0359b24"
  head "https://github.com/idealvin/coost.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "openssl@3"

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
