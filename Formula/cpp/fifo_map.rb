class FifoMap < Formula
  desc "Header-only C++ library for a FIFO-ordered associative container"
  homepage "https://github.com/nlohmann/fifo_map"
  url "https://github.com/nlohmann/fifo_map/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "cbf8ed2551a16989e5cf25b74d0fb98cb5828f25acbebe3825c992d13dd37f13"
  license "MIT"

  def install
    include.install "src/fifo_map.hpp"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <fifo_map.hpp>
      int main() {
        nlohmann::fifo_map<std::string, int> m;
        m["b"] = 2;
        m["a"] = 1;
        return m.begin()->first == "b" ? 0 : 1;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test"
    system "./test"
  end
end
