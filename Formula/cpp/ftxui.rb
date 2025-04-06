class Ftxui < Formula
  desc "C++ Functional Terminal User Interface."
  homepage "https://github.com/ArthurSonzogni/FTXUI"
  url "https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v6.0.2.tar.gz"
  sha256 "ace3477a8dd7cdb911dbc75e7b43cdcc9cf1d4a3cc3fb41168ecc31c06626cb9"
  head "https://github.com/ArthurSonzogni/FTXUI.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DBUILD_SHARED_LIBS=ON
      -DFTXUI_BUILD_DOCS=ON
      -DFTXUI_BUILD_EXAMPLES=ON
      -DFTXUI_BUILD_TESTS=ON
      -DFTXUI_QUIET=ON
      -DFTXUI_ENABLE_COVERAGE=ON
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
