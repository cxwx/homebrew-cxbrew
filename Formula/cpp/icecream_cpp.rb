class IcecreamCpp < Formula
  desc "Never use cout/printf to debug again"
  homepage "https://github.com/renatoGarcia/icecream-cpp"
  url "https://github.com/renatoGarcia/icecream-cpp/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "efad02e4fec7173fe87ae36f6179cbcee1dd3aa48240c7a02fcb80c5e956805e"
  head "https://github.com/renatoGarcia/icecream-cpp.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    assert_path_exists include/"icecream.hpp"
  end
end
