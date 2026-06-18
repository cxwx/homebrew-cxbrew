class Cnpypp < Formula
  desc "C++ io of numpy 2023"
  homepage "https://gitlab.iap.kit.edu/mreininghaus/cnpypp"
  url "https://gitlab.iap.kit.edu/mreininghaus/cnpypp/-/archive/v2.3.0/cnpypp-v2.3.0.tar.gz"
  sha256 "d0af93cf1735888e49bf6e12533e5b8bd80ca9216b09d60de1fff69f0f39b3db"
  head "https://gitlab.iap.kit.edu/mreininghaus/cnpypp.git", branch: "master"

  depends_on "cmake" => [:build, :test]
  depends_on "boost"
  depends_on "range-v3"


  def install
    mkdir "corsika-build" do
      args = std_cmake_args + %w[
        ../
        -DCNPYPP_SPAN_IMPL=BOOST
      ]

      system "cmake", *args
      system "make cnpy++ install"
    end
  end
end
