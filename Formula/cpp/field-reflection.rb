class FieldReflection < Formula
  desc "Compile-time reflection for C++ to get field names and types from a struct/class"
  homepage "https://github.com/yosh-matsuda/field-reflection"
  url "https://github.com/yosh-matsuda/field-reflection/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "42c92b98e441b5d01d02d02b6cdeaca019975f81dfafc2650ea6c207cadac538"
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
