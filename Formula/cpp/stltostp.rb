class Stltostp < Formula
  desc "Convert stl files to STEP brep files"
  homepage "https://github.com/slugdev/stltostp"
  # 仅 head:stable v1.0.1 的 main.cpp 在新工具链下编译报错,上游 tag 未修,master 已修。
  license "BSD-4-Clause"
  head "https://github.com/slugdev/stltostp.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  def caveats
    <<~EOS
      仅 head 版本:stable v1.0.1 的代码在新编译器下报错,无法直接构建。
      请用 `brew install --HEAD stltostp`。
    EOS
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
