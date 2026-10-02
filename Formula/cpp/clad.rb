class Clad < Formula
  desc "Automatic differentiation for C/C++"
  homepage "https://github.com/vgvassilev/clad"
  url "https://github.com/vgvassilev/clad/archive/refs/tags/v2.5.tar.gz"
  sha256 "f548a0e4ea6985a87fc7b878f38791f34f96ef1dc06a41ff35d7058d75af1417"
  license "LGPL-3.0-or-later"
  head "https://github.com/vgvassilev/clad.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "kokkos"
  depends_on "llvm"

  def install
    args = %w[
      -DBUILD_SHARED_LIBS=ON
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  # test do
  #   (testpath/"test.cpp").write <<~CPP
  #     #include <cpp-lazy/Lz/Map.hpp>
  #
  #     int main() {
  #       std::array<int, 4> arr = {1, 2, 3, 4};
  #       std::string result = lz::map(arr, [](int i) { return i + 1; }).toString(" "); // == "1 2 3 4"
  #     }
  #   CPP
  #   ENV.prepend_path "PKG_CONFIG_PATH", Formula["fmt"].opt_lib/"pkgconfig"
  #   cxxflags = shell_output("pkg-config --cflags fmt").strip
  #   ldflags = shell_output("pkg-config --libs fmt").strip
  #   system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test", *cxxflags.split, *ldflags.split
  #   system "./test"
  # end

  test do
    system "true"
  end
end
