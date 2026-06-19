class Libhv < Formula
  desc "C/C++ network lib for TCP/UDP/SSL/HTTP/WebSocket/MQTT client/server"
  homepage "https://github.com/ithewei/libhv"
  url "https://github.com/ithewei/libhv/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "f0a9a197f90da55cc3ff104f9c7a27cc927f117b6c18613c3292726068588e10"
  license "Apache-2.0"
  head "https://github.com/ithewei/libhv.git", branch: "master"

  # keg_only :versioned_formula

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[]
    system "cmake", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
    system "true"
  end
end
