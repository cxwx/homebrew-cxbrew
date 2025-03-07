class VisitStruct < Formula
  desc "miniature library for struct-field reflection in C++"
  homepage "https://github.com/cbeck88/visit_struct"
  license "Boost Software License"
  head "https://github.com/cbeck88/visit_struct.git", branch: "master"

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
