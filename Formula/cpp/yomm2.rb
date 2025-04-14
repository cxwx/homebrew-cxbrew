class Yomm2 < Formula
  desc "Fast, orthogonal, open multi-methods. Solve the Expression Problem in C++17"
  homepage "https://github.com/jll63/yomm2"
  url "https://github.com/jll63/yomm2/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "5d617704755637b863a90129d09b8c3a1d3a06e3be809693c07575e0289cb508"
  license "BSL-1.0"
  head "https://github.com/jll63/yomm2.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = %w[
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
end
