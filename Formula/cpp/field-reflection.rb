class FieldReflection < Formula
  desc "Compile-time reflection for C++ to get field names and types from a struct/class"
  homepage "https://github.com/yosh-matsuda/field-reflection"
  url "https://github.com/yosh-matsuda/field-reflection/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "c81ffd612365bbdd6d829cc387d269347b1fe4685b2101e33fdc53fa5be6cc2b"
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
