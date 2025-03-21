class Veccore < Formula
  desc "C++ Library for Portable SIMD Vectorization"
  homepage "https://github.com/root-project/veccore"
  url "https://github.com/root-project/veccore/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "1268bca92acf00acd9775f1e79a2da7b1d902733d17e283e0dd5e02c41ac9666"
  head "https://github.com/root-project/veccore.git"

  depends_on "cmake" => :build
  # depends_on "umesimd" -- old
  depends_on "vc"

  def install
    args = %w[
      -DUMESIMD=OFF
      -DVC=ON
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <VecCore/VecCore>
      #include <iostream>
      auto main() -> int {
        std::cout<<vecCore::Rad<double>(0.0)<<std::endl;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++20", "-o", "test"
    assert_equal "0", shell_output("./test").chomp
  end
end
