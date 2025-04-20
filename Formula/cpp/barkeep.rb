class Barkeep < Formula
  desc "Small C++ header to display async animations, counters, progress bars, and status messages"
  homepage "https://github.com/oir/barkeep"
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
