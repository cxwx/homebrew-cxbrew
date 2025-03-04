class InifileCpp < Formula
  desc "header-only and easy to use Ini file parser for C++"
  homepage "https://github.com/Rookfighter/inifile-cpp"
  license "MIT"
  head "https://github.com/Rookfighter/inifile-cpp.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <inicpp.h>
      int main() {
        ini::IniFile myIni;
        myIni["Foo"]["myInt"] = 1;
        myIni["Foo"]["myStr"] = "Hello world";
        myIni["Foo"]["myBool"] = true;
        myIni["Bar"]["myDouble"] = 1.2;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test"
    system "./test"
  end
end
