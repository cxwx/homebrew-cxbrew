# cspell:disable
class PlfIndiesort < Formula
  desc "Sort wrapper for random-access sorting on non-random-access containers"
  homepage "https://github.com/mattreecebentley/plf_indiesort"
  # url "https://github.com/mattreecebentley/plf_indiesort"
  head "https://github.com/mattreecebentley/plf_indiesort.git", branch: "master"

  def install
    include.install "plf_indiesort.h"
  end
end
