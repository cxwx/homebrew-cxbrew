# cspell:disable
class Highfive < Formula
  desc "High Five c++"
  homepage "https://github.com/BlueBrain/HighFive"
  head "https://github.com/BlueBrain/HighFive.git", branch: "master"

  depends_on "cmake" => :build


  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
