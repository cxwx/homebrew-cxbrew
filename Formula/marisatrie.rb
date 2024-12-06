# cspell:disable
class Marisatrie < Formula
  desc "Marisa-Trie"
  homepage "https://github.com/rime/marisa-trie"
  # head "https://github.com/rime/marisa-trie", branch: "master"
  # url "https://codeload.github.com/rime/marisa-trie/archive/0d4e8ab.tar.gz"
  url "https://github.com/rime/marisa-trie/archive/0d4e8ab.tar.gz"
  version "0.2.6"

  depends_on "cmake" => :build

  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
end
