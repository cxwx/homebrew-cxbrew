class Stltostp < Formula
  desc "Convert stl files to STEP brep files"
  homepage "https://github.com/slugdev/stltostp"
  url "https://github.com/slugdev/stltostp/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "bb812a2a3eff0483fe8dc8d105cc4fc673ec4fa42a7942fa60cd3447353a9a4b"
  license "BSD-4-Clause"
  head "https://github.com/slugdev/stltostp.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  # test do
  #   (testpath/"test.cpp").write <<~CPP
  #     #include <cpp-lazy/Lz/Map.hpp>
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
