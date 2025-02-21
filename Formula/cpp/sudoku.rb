class Sudoku < Formula
  desc "C++实现的跨平台数独游戏，命令行操作易上手，可以在开发间隙用来放松身心。数百行代码，初学者也可以轻松掌握。"
  homepage "https://github.com/mayerui/sudoku"
  head "https://github.com/mayerui/sudoku.git", branch: "master"

  depends_on "cmake" => :build

  conflicts_with "nbsdgames", because: "both install `sudoku`"

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}"
    system "cmake", "--build", "builddir"
    bin.install "bin/sudoku"
  end
  test do
    system "echo", "not finished"
  end
end
