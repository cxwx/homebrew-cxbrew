class Kokkos < Formula
  desc "Kokkos C++ Performance Portability Programming Ecosystem: The Programming Model - Parallel Execution and Memory Abstraction"
  homepage "kokkos.org"
  url "https://github.com/kokkos/kokkos/archive/refs/tags/4.5.01.tar.gz"
  sha256 "e0008c89d7f03ebbe31eb3c89d40fe529b4e4072b40331ae6b9d6599f02dff44"
  license "Apache-2.0"
  head "https://github.com/kokkos/kokkos.git", branch: "develop"

  depends_on "cmake" => :build

  def install
    args = %w[
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <cpp-lazy/Lz/Map.hpp>

      int main() {
        std::array<int, 4> arr = {1, 2, 3, 4};
        std::string result = lz::map(arr, [](int i) { return i + 1; }).toString(" "); // == "1 2 3 4"
      }
    CPP
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["fmt"].opt_lib/"pkgconfig"
    cxxflags = shell_output("pkg-config --cflags fmt").strip
    ldflags = shell_output("pkg-config --libs fmt").strip
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test", *cxxflags.split, *ldflags.split
    system "./test"
  end
end
