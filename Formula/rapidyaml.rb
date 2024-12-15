# cspell:disable
class Rapidyaml < Formula
  desc "a library to parse and emit YAML, and do it fast"
  homepage "https://github.com/biojppm/rapidyaml"
  # url "https://github.com/biojppm/rapidyaml/archive/refs/tags/v0.7.2.tar.gz"
  url "https://github.com/biojppm/rapidyaml/releases/download/v0.7.2/rapidyaml-0.7.2-src.tgz"
  version "0.7.2"

  depends_on "cmake" => :build

  def install
    system "cmake . -B builddir -DCMAKE_INSTALL_PREFIX=#{prefix} -DBUILD_SHARED_LIBS=ON"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
