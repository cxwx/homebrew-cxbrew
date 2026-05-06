class Minilisp < Formula
  desc "A readable lisp in less than 1k lines of C"
  homepage "https://github.com/rui314/minilisp"
  head "https://github.com/rui314/minilisp.git", branch: "master"

  depends_on "make" => :build

  def install
    system "make"
    bin.install "minilisp"
  end
end
