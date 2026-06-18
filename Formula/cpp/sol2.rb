class Sol2 < Formula
  desc "Sol3 (sol2 v3.0) - a C++ <-> Lua API wrapper with advanced features and top notch performance"
  homepage "https://sol2.rtfd.io"
  url "https://github.com/ThePhD/sol2/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "86c0f6d2836b184a250fc2907091c076bf53c9603dd291eaebade36cc342e13c"
  # head "https://github.com/ThePhD/sol2.git", branch: "develop"
  head "https://github.com/cxwx/sol2.git", branch: "develop"

  depends_on "cmake" => :build
  depends_on "lua" => :test

  def install
    mkdir "build" do
      args = std_cmake_args + %w[
        ../
      ]

      system "cmake", *args
      system "make", "install"
    end
  end

  # FAIL: test
  # test do
  # #define SOL_ALL_SAFETIES_ON 1
  #include <sol/sol.hpp> // or #include "sol.hpp", whichever suits your needs
#
# int main(int argc, char* argv[]) {
# 	sol::state lua;
# 	lua.open_libraries(sol::lib::base);
# 	lua.script("print('bark bark bark!')");
# }
  # end

  test do
  end
end
