# cspell:disable
class Highfive < Formula
  desc "High Five c++"
  homepage "https://github.com/BlueBrain/HighFive"
  url "https://github.com/BlueBrain/HighFive/archive/refs/tags/v2.10.1.tar.gz"
  version "2.10.1"
  head "https://github.com/BlueBrain/HighFive.git", branch: "master"

  depends_on "cmake" => :build


  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
