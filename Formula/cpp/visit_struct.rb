class VisitStruct < Formula
  desc "Miniature library for struct-field reflection in C++"
  homepage "https://github.com/cbeck88/visit_struct"
  url "https://github.com/cbeck88/visit_struct/archive/refs/tags/1.2.0.tar.gz"
  sha256 "aa0f4cc674ee584e0498604971c8bbdc0eeb7d6d6386c95695211b0418ff2bef"
  license "BSL-1.0"
  head "https://github.com/cbeck88/visit_struct.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <visit_struct/visit_struct.hpp>
      #include <sstream>
      #include <string>

      struct my_type {
        int a;
        float b;
        std::string c;
      };

      VISITABLE_STRUCT(my_type, a, b, c);

      struct printer {
        std::ostringstream &ss;
        template <typename T>
        void operator()(const char *name, const T &v) {
          ss << name << "=" << v << ";";
        }
      };

      int main() {
        my_type obj{1, 2.5f, "hello"};
        std::ostringstream ss;
        printer p{ss};
        visit_struct::apply_visitor(p, obj);
        std::string result = ss.str();
        if (result.find("a=1;") == std::string::npos) return 1;
        if (result.find("b=") == std::string::npos) return 1;
        if (result.find("c=hello;") == std::string::npos) return 1;
        return 0;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++11", "-I#{include}", "-o", "test"
    system "./test"
  end
end
