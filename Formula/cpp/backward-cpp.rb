class BackwardCpp < Formula
  desc "Beautiful stack trace pretty printer for C++"
  homepage "https://github.com/bombela/backward-cpp"
  url "https://github.com/bombela/backward-cpp/archive/refs/tags/v1.6.tar.gz"
  sha256 "c654d0923d43f1cea23d086729673498e4741fb2457e806cfaeaea7b20c97c10"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir",
           "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
           *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include "backward.hpp"
      int main() {
        backward::StackTrace st;
        st.load_here(32);
        backward::Printer p;
        p.print(st);
        return 0;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test"
    system "./test"
  end
end
