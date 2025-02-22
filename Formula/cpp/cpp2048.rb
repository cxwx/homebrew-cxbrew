class Cpp2048 < Formula
  desc "Fully featured terminal version of the game \"2048\" written in C++"
  homepage "https://github.com/plibither8/2048.cpp"
  license "MIT"
  head "https://github.com/plibither8/2048.cpp.git", branch: "master"

  # The dependency 'sundials' is commented out due to a bug

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}"
    system "cmake", "--build", "builddir"
    # system "cmake", "--install", "builddir"
    bin.install "builddir/2048"
    mv "#{bin}/2048", "#{bin}/cpp2048"
    # install "builddir/2048" => "#{bin}/cpp2048"
  end
  test do
    system "echo", "not finished"
  end
end
