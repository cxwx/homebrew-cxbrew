class Sol2 < Formula
  desc "Sol3 (sol2 v3.0) - a C++ <-> Lua API wrapper with advanced features and top notch performance"
  homepage "https://sol2.rtfd.io"
  url "https://github.com/ThePhD/sol2.git"
  sha256 "9351f196f89df35906f721619c4e7fef50473130fcf42cf3dbaac7a1147ac032"
  # tag ISSUE: https://github.com/ThePhD/sol2/issues/1661
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

  # TODO: test
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
end
