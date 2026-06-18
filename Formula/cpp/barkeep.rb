class Barkeep < Formula
  desc "Small C++ header to display async animations, counters, progress bars, and status messages"
  homepage "https://github.com/oir/barkeep"
  url "https://github.com/oir/barkeep/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "fbb1a1ae1243ac553c8107a5f241793ee3f6d069d37430d0711a8e45feaa4628"
  license "Apache-2.0"
  head "https://github.com/oir/barkeep.git", branch: "main"


  def install
    include.install "barkeep"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
    CPP
    system ENV.cxx, "test.cpp", "-std=c++20", "-o", "test", *cxxflags.split, *ldflags.split
    system "./test"
  end
end
