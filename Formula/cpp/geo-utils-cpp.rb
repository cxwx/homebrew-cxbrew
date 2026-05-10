class GeoUtilsCpp < Formula
  desc "Header-only C++17 library for geographic calculations on a sphere"
  homepage "https://github.com/gistrec/geo-utils-cpp"
  url "https://github.com/gistrec/geo-utils-cpp/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "2594b5dd736dab3ee99dc586dd326f699b90243b6074df582a32547f90b82a08"
  license "Apache-2.0"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir",
           "-DGEO_UTILS_CPP_BUILD_TESTS=OFF",
           "-DGEO_UTILS_CPP_BUILD_EXAMPLES=OFF",
           *std_cmake_args
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <geo/spherical.hpp>
      int main() {
        geo::LatLng a(37.7749, -122.4194);
        geo::LatLng b(34.0522, -118.2437);
        double d = geo::distance_between(a, b);
        return d > 0 ? 0 : 1;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++17", "-o", "test"
    system "./test"
  end
end
