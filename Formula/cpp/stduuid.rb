class Stduuid < Formula
  desc "C++17 cross-platform implementation for UUIDs"
  homepage "https://github.com/mariusbancila/stduuid"
  url "https://github.com/mariusbancila/stduuid/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "b1176597e789531c38481acbbed2a6894ad419aab0979c10410d59eb0ebf40d3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir",
           "-DUUID_BUILD_TESTS=OFF", "-DUUID_ENABLE_INSTALL=ON", *std_cmake_args
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <uuid.h>
      int main() {
        using namespace uuids;
        auto const id = uuid::from_string("47183823-2574-4bfd-b411-99ed177d3e43");
        return id.has_value() && !id->is_nil() ? 0 : 1;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++17", "-I#{include}", "-o", "test"
    system "./test"
  end
end
