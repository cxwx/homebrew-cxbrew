class Plotlypp < Formula
  desc "C++ interface to the Plotly.js figure spec for interactive data visualization"
  homepage "https://github.com/jimmyorourke/plotlypp"
  head "https://github.com/jimmyorourke/plotlypp.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "nlohmann-json"

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DPLOTLYPP_BUILD_EXAMPLES=OFF",
           *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_path_exists include/"plotlypp/figure.hpp"
  end
end
