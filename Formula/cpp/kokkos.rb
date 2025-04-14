class Kokkos < Formula
  desc "C++ Performance Portability Programming Ecosystem"
  homepage "https://kokkos.org"
  url "https://github.com/kokkos/kokkos/archive/refs/tags/4.6.00.tar.gz"
  sha256 "348b2d860046fc3ddef5ca3a128317be1a6f3fa35196f268338a180fcae52264"
  license "Apache-2.0"
  head "https://github.com/kokkos/kokkos.git", branch: "develop"

  depends_on "cmake" => :build

  def install
    args = %w[
      -DBUILD_SHARED_LIBS=ON
      -DKokkos_ENABLE_THREADS=ON
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"

    # BUG: before merge to core
    shim_path = "/opt/homebrew/Library/Homebrew/shims/mac/super"
    inreplace ["bin/kokkos_launch_compiler", "lib/cmake/Kokkos/KokkosConfigCommon.cmake"] do |s|
      s.gsub! shim_path, "/usr/bin"  # 或你觉得合理的路径
    end
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <Kokkos_Core.hpp>
      auto main(int argc, char** argv) -> int {
        Kokkos::initialize(argc, argv);
        {
          Kokkos::View<int*> v("v", 5);
          Kokkos::parallel_for("fill", 5, KOKKOS_LAMBDA(int i) { v(i) = i; });
          int r = 0;
          Kokkos::parallel_reduce(
            "accumulate", 5,
            KOKKOS_LAMBDA(int i, int& partial_r) { partial_r += v(i); }, r);
          KOKKOS_ASSERT(r == 10);
        }
        Kokkos::printf("Goodbye World");
        Kokkos::finalize();
        return 0;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++17", "-o", "test", "-L#{lib}", "-lkokkoscore"
    assert_equal "Goodbye World", shell_output("./test")
  end
end
