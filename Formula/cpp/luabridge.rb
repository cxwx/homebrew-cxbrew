# cspell:disable
class Luabridge < Formula
  desc "Lightweight, dependency-free library for binding Lua to C++"
  homepage "https://github.com/vinniefalco/LuaBridge"

  url "https://github.com/vinniefalco/LuaBridge/archive/refs/tags/2.10.tar.gz"
  sha256 "a9bfd72ce041b84b97c9e538e0432ee6511f3673ca71f262301015649a1db2fa"

  license "MIT"

  def install
    (include/"LuaBridge").install Dir["Source/LuaBridge/*.h"]
    (include/"LuaBridge/detail").install Dir["Source/LuaBridge/detail/*.h"]
  end

  test do
    assert_path_exists include/"LuaBridge/LuaBridge.h"
  end
end
