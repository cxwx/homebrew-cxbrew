class Fkyaml < Formula
  desc "C++ header-only YAML library"
  homepage "https://github.com/fktn-k/fkYAML"
  url "https://github.com/fktn-k/fkYAML/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "6b0c04d8f7505bb55db690c921e684fadbe719cfba351aeed2da087828775f3a"
  license "MIT"
  head "https://github.com/fktn-k/fkYAML.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <iostream>
      #include <string>
      #include <fkYAML/node.hpp>

      int main() {
        std::string yaml = R"(
project: fkYAML
        )";
        auto node = fkyaml::node::deserialize(yaml);
        node["maintainer"] = "fktn-k";
        std::cout << node;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++14", "-o", "test"
    system "./test"
  end
end
