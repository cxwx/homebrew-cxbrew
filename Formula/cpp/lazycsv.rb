class Lazycsv < Formula
  desc "Fast, lightweight and single-header C++ csv parser library"
  homepage "https://github.com/ashtum/lazycsv"
  license "MIT"
  head "https://github.com/ashtum/lazycsv.git", branch: "master"

  depends_on "cmake" => :build

  # DONE: github:ashtum/lazycsv/pull/14
  def install
    args = %w[
      -DBUILD_SHARED_LIBS=ON
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
    system ENV.cxx, "test.cpp", "-std=c++17", "-o", "test", *cxxflags.split, *ldflags.split
    system "./test"
  end
end
