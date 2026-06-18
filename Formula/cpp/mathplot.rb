class Mathplot < Formula
  desc "Plotting, graphing and data visualization for C++ programs"
  homepage "https://github.com/sebsjames/mathplot"
  # 仅 head:stable 的 GitHub archive 不含 git submodule(maths),cmake find_path 找不到
  # maths/sm/algo 而失败;改用 resource 复刻 submodule 则每次 bump 都要手动同步 maths 的
  # commit+sha256,成本高。故只留 head,通过 submodules: true 递归 clone maths。
  head "https://github.com/sebsjames/mathplot.git", branch: "main", submodules: true

  depends_on "cmake" => :build
  depends_on "freetype"
  depends_on "glfw"
  depends_on "nlohmann-json"

  on_linux do
    depends_on "mesa"
    depends_on "mesa-glu"
    depends_on "libx11"
  end

  def install
    args = %w[
      -DBUILD_EXAMPLES=OFF
      -DBUILD_TESTS=OFF
      -DBUILD_DOC=OFF
    ]

    if OS.linux?
      # Ensure CMake looks in the Homebrew prefix for OpenGL
      args << "-DOPENGL_opengl_LIBRARY=#{Formula["mesa"].opt_lib}/libGL.so"
      args << "-DOPENGL_glx_LIBRARY=#{Formula["mesa"].opt_lib}/libGL.so"
      args << "-DOPENGL_INCLUDE_DIR=#{Formula["mesa"].opt_include}"
      
      # Sometimes GLVND still fails on Linuxbrew; forcing LEGACY often bypasses the libOpenGL.so requirement
      inreplace "CMakeLists.txt", /set\(OpenGL_GL_PREFERENCE .*\)/, 'set(OpenGL_GL_PREFERENCE "LEGACY")'
    end

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  def caveats
    <<~EOS
      仅 head 版本:stable 的 GitHub archive 缺 maths submodule,无法直接构建。
      请用 `brew install --HEAD mathplot`。
    EOS
  end

  test do
    assert_path_exists include/"mplot/Visual.h"
  end
end
