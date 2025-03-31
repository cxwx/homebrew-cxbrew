class Flowchar < Formula
  desc "A tiny tool for conversion from pseudo-code to flowchart in character format."
  homepage "https://github.com/Gusabary/FlowChar"
  url "https://github.com/Gusabary/FlowChar/archive/refs/tags/v1.1.tar.gz"
  sha256 "d46b0cd5abcfbfc81348d6408d7026a9bfdfebaa06f33a549d3dd64b9f633252"
  head "https://github.com/Gusabary/FlowChar.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}"
    system "cmake", "--build", "builddir"
    # system "cmake", "--install", "builddir"
    bin.install "builddir/flowchar"
  end
  test do
    system "echo", "not finished"
  end
end
