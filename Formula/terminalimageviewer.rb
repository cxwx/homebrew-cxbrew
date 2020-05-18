class Terminalimageviewer < Formula
  desc "Display images in a terminal using block graphic characters"
  homepage "https://github.com/stefanhaustein/TerminalImageViewer"
  url "https://github.com/cxwx/TerminalImageViewer/archive/1.0.1.tar.gz"
  sha256 "ed46a1806dec82dd89dd3f9174ff74568b0a912153c7615a1b952104a353e648"
  head "https://github.com/stefanhaustein/TerminalImageViewer.git"
  depends_on "gcc" => :build unless OS.linux?
  depends_on "imagemagick"

  def install
    cd "src/main/cpp" do
      system "make"
      if OS.mac?
        # No expermimental/filesystem.h on mac
        # system "#{Formula["gcc"].opt_bin}/gcc-#{Formula["gcc"].version_suffix}", "-std=c++17",
        system "c++", "-std=c++17",
                      "-Wall",
                      "-fpermissive",
                      "-fexceptions",
                      "-O2", "-c",
                      "tiv.cpp", "-o", "tiv.o"
        system "c++", "tiv.o", "-o", 
                      "tiv", "-L/usr/local/opt/gcc/lib/gcc/9/", "-lstdc++fs",
                      "-pthread", "-s"
      else
        system "make"
      end
      bin.install "tiv"
    end
  end

  test do
    # Downloads a public domain test file from wikimedia commons and displays it.
    # For some reason, when you redirect the output it is blank.
    assert_equal "",
    shell_output("#{bin}/tiv -0 https://upload.wikimedia.org/wikipedia/commons/2/24/Cornell_box.png").strip
  end
end
