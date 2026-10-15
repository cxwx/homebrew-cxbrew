class FieldReflection < Formula
  desc "Compile-time reflection for C++ to get field names and types from a struct/class"
  homepage "https://github.com/yosh-matsuda/field-reflection"
  url "https://github.com/yosh-matsuda/field-reflection/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3ff7cbb39381125a54a529c6e08620c1681d581a1506f72eb85e3aa28aa4256c"
  license "MIT"
  head "https://github.com/yosh-matsuda/field-reflection.git", branch: "main"

  depends_on "cmake" => :build

  def install
    # Avoid needing GTest: tests build by default when this is the top-level project.
    args = %w[
      -DFIELD_RFL_BUILD_TEST=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write ""
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test"
    system "./test"
  end
end
