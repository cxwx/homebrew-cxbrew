class Terminalimageviewer < Formula
  desc "Display images in a terminal using block graphic characters"
  homepage "https://github.com/stefanhaustein/TerminalImageViewer"
  url "https://github.com/stefanhaustein/TerminalImageViewer/archive/v1.1.0.tar.gz"
  head "https://github.com/stefanhaustein/TerminalImageViewer.git"
  depends_on "gcc" => :build unless OS.linux?
  depends_on "imagemagick"

  def install
    cd "src/main/cpp" do
      if OS.mac?
        system "c++", "-std=c++17",
                      "-Wall",
                      "-fpermissive",
                      "-fexceptions",
                      "-O2", "-c",
                      "-L/usr/local/opt/gcc/lib/gcc/10/",
                      "tiv.cpp", "-o", "tiv.o"
        system "c++", "tiv.o", "-o",
                      "tiv", "-L/usr/local/opt/gcc/lib/gcc/10/", "-lstdc++fs",
                      "-pthread", "-s"
      else
        system "make"
      end
      bin.install "tiv"
    end
  end

  test do
    assert_equal "",
    shell_output("#{bin}/tiv -0 https://upload.wikimedia.org/wikipedia/commons/2/24/Cornell_box.png").strip
  end
end
