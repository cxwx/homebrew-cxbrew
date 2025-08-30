class Decoratorcpp < Formula
  desc "A modern C++ decorator template implementation"
  homepage "https://github.com/caomengxuan666/DecoratorCPP"
  head "https://github.com/caomengxuan666/DecoratorCPP.git", branch: "master"

  def install
    include.install "samples/decorator.hpp"
    include.install "samples/logDecorator.hpp"
  end
end
