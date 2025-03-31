class Cnpypp < Formula
  desc "C++ io of numpy 2023"
  homepage "https://gitlab.iap.kit.edu/mreininghaus/cnpypp"
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
