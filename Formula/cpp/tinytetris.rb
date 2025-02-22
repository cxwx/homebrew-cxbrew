class Tinytetris < Formula
  desc "80x23 terminal tetris!"
  homepage "https://github.com/taylorconor/tinytetris"
  head "https://github.com/taylorconor/tinytetris.git", branch: "master"

  depends_on "ncurses"

  def install
    system "g++", "tinytetris.cpp", "-lncurses", "-o", "tinytetris"
    bin.install "tinytetris"
  end
end
