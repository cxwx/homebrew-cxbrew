class Cxxgraph < Formula
  desc "Comprehensive C++ library for graph data structures and algorithms"
  homepage "https://github.com/ZigRazor/CXXGraph"
  url "https://github.com/ZigRazor/CXXGraph/archive/refs/tags/v4.1.0.tar.gz"
  sha256 "1f6601abfcb692f35bfe14f2a34b2302f70213a257b0f7d541a110d6bd460040"
  license "MPL-2.0"
  head "https://github.com/ZigRazor/CXXGraph.git", branch: "master"

  livecheck do
    url :head
    regex(/^v(\d+(?:\.\d+)+)$/i)
  end

  depends_on "cmake" => :build

  def install
    args = %w[
      -DTEST=OFF
      -DBENCHMARK=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <iostream>
      #include <memory>
      #include <CXXGraph/CXXGraph.hpp>

      int main() {
        CXXGraph::Node<int> a("a", 0);
        CXXGraph::Node<int> b("b", 1);
        CXXGraph::Node<int> c("c", 2);
        auto e1 = std::make_shared<CXXGraph::UndirectedEdge<int>>(0, a, b);
        auto e2 = std::make_shared<CXXGraph::UndirectedEdge<int>>(1, b, c);
        CXXGraph::T_EdgeSet<int> edges = {e1, e2};
        CXXGraph::Graph<int> graph(edges);
        std::cout << "Nodes: " << graph.getNodeSet().size() << std::endl;
        std::cout << "Edges: " << graph.getEdgeSet().size() << std::endl;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++17", "-o", "test"
    system "./test"
  end
end
