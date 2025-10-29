class IcecreamCpp < Formula
  desc "Never use cout/printf to debug again"
  homepage "https://github.com/renatoGarcia/icecream-cpp"
  url "https://github.com/renatoGarcia/icecream-cpp"
  head "https://github.com/renatoGarcia/icecream-cpp.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
end
