class Htmlpp < Formula
  desc "Write HTML using C++ templates"
  homepage "https://github.com/csb6/html-plus-plus"
  head "https://github.com/csb6/html-plus-plus.git", branch: "master"

  def install
    include.install "html++.h"
  end
end
