class LuaFormatter < Formula
  desc "Code formatter for Lua"
  homepage "https://github.com/Koihik/LuaFormatter"
  url "https://github.com/Koihik/LuaFormatter/archive/refs/tags/1.3.6.tar.gz"
  sha256 "57dff41282f2e039f7f323511f2c9c238a174f2772fba567bb083bc3ed9230da"
  license "Apache-2.0"
  head "https://github.com/Koihik/LuaFormatter.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "cmake" => :build

  # The release archive omits git submodules; CMake compiles these directly,
  # so stage them where the top-level CMakeLists.txt expects them.
  resource "antlr4" do
    url "https://github.com/antlr/antlr4/archive/be58ebffde8e29c154192c019608f0a5b8e6a064.tar.gz"
    sha256 "9de4838137cce66556b184ad01472b51aa2abc39b0d51a86b62e2236d165a0aa"
  end

  resource "yaml-cpp" do
    url "https://github.com/jbeder/yaml-cpp/archive/9a3624205e8774953ef18f57067b3426c1c5ada6.tar.gz"
    sha256 "e39f54bd2927692603378e373009e56b4891701cee8af7c27370c36978a43ffa"
  end

  resource "args" do
    url "https://github.com/Taywee/args/archive/78e27faf75ff7d20f232f11ffcef65cde43c449d.tar.gz"
    sha256 "da43c0416f8ac74ab0e1d51ffae920278945c97c74b905c67c45e1747e1e2150"
  end

  def install
    resource("antlr4").stage(buildpath/"third_party/antlr4")
    resource("yaml-cpp").stage(buildpath/"third_party/yaml-cpp")
    resource("args").stage(buildpath/"third_party/args")

    args = std_cmake_args + %w[-DBUILD_TESTS=OFF -DCOVERAGE=OFF]
    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    assert_equal "local x = 1\n", pipe_output("#{bin}/lua-format", "local x=1\n")
  end
end
