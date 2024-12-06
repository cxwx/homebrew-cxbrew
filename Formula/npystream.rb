# cspell:disable
class Npystream < Formula
  desc "C++20 library for streaming data to .npy files "
  homepage "https://github.com/mreininghaus/npystream"
  # url "https://github.com/dealii/dealii/releases/download/v9.5.2/dealii-9.5.2.tar.gz"
  # sha256 "7930e5218a9807d60cc05c300a3b70f36f4af22c3551a2cd1141fbab013bbaf1"
  license "EUPL"
  head "https://github.com/mreininghaus/npystream.git", branch: "master"

  # The dependency 'sundials' is commented out due to a bug

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DBUILD_SHARED_LIBS=ON", "-DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
    system "echo", "not finished"
  end
end
