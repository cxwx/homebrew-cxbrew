class Libhv < Formula
  desc "A c/c++ network library for developing TCP/UDP/SSL/HTTP/WebSocket/MQTT client/server."
  homepage "https://github.com/ithewei/libhv"
  url "https://github.com/ithewei/libhv/archive/refs/tags/v1.3.3.tar.gz"
  sha256 "dfeae857eb5d167820d0800161b6c4199d1f771c05a04e6dd0adc22ed3fd19ae"
  license "Apache-2.0"
  head "https://github.com/ithewei/libhv.git", branch: "master"

  # keg_only :versioned_formula

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
    system "echo", "not finished"
  end
end
