class Tellenc < Formula
  desc "Program to detect the encoding of a text file"
  homepage "https://github.com/adah1972/tellenc"
  license "Zlib"
  head "https://github.com/adah1972/tellenc.git", branch: "master"

  def install
    system ENV.cxx, "-O2", "tellenc.cpp", "-o", "tellenc"
    bin.install "tellenc"
  end

  test do
    (testpath/"test.txt").write "Hello, world!"
    assert_equal "ascii\n", shell_output("#{bin}/tellenc #{testpath}/test.txt")
  end
end
