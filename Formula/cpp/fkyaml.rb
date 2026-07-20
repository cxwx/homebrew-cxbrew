class Fkyaml < Formula
  desc "C++ header-only YAML library"
  homepage "https://github.com/fktn-k/fkYAML"
  url "https://github.com/fktn-k/fkYAML/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "f23790bbe64eb9a5f0c8e73d2890f7143b1ed8f5d22d5e42a032ede68b664d29"
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
