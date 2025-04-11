class Playrho < Formula
  desc "interactive physics engine & library"
  homepage "https://github.com/louis-langholtz/PlayRho"
  url "https://github.com/louis-langholtz/PlayRho/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "b8e61eace48607c545a495c742479fb58e7ea34b8dfe7f874a14b8414135cccc"
  license "Zlib"
  head "https://github.com/louis-langholtz/PlayRho.git", branch: "master"

  depends_on "cmake" => :build

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
end
