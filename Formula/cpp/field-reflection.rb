class FieldReflection < Formula
  desc "Compile-time reflection for C++ to get field names and types from a struct/class"
  homepage "https://github.com/yosh-matsuda/field-reflection"
  license "MIT"
  head "https://github.com/yosh-matsuda/field-reflection.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
    CPP
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test"
    system "./test"
  end
end
