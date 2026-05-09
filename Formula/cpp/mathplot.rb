class Mathplot < Formula
  desc "Plotting, graphing and data visualization for C++ programs"
  homepage "https://github.com/sebsjames/mathplot"
  head "https://github.com/sebsjames/mathplot.git", branch: "main", submodules: true

  depends_on "cmake" => :build
  depends_on "freetype"
  depends_on "glfw"
  depends_on "nlohmann-json"

  on_linux do
    depends_on "mesa"
    depends_on "mesa-glu"
  end

  def install
    if OS.linux?
      inreplace "CMakeLists.txt",
                'set(OpenGL_GL_PREFERENCE "GLVND")',
                'set(OpenGL_GL_PREFERENCE "LEGACY")'
    end

    args = %w[
      -DBUILD_EXAMPLES=OFF
      -DBUILD_TESTS=OFF
      -DBUILD_DOC=OFF
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_path_exists include/"mplot/Visual.h"
  end
end
