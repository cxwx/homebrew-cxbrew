class Ftxui < Formula
  desc "C++ Functional Terminal User Interface"
  homepage "https://github.com/ArthurSonzogni/FTXUI"
  url "https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v6.0.2.tar.gz"
  sha256 "ace3477a8dd7cdb911dbc75e7b43cdcc9cf1d4a3cc3fb41168ecc31c06626cb9"
  license "MIT"
  head "https://github.com/ArthurSonzogni/FTXUI.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = %W[
      -DBUILD_SHARED_LIBS=ON
      -DCMAKE_INSTALL_RPATH=#{rpath}
      -DFTXUI_BUILD_DOCS=ON
      -DFTXUI_BUILD_EXAMPLES=OFF
      -DFTXUI_BUILD_TESTS=OFF
      -DFTXUI_QUIET=ON
      -DFTXUI_ENABLE_COVERAGE=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <ftxui/dom/elements.hpp>
      int main() {
        using namespace ftxui;
        auto summary = [&] {
        auto content = vbox({
          hbox({text(L"- done:   "), text(L"3") | bold}) | color(Color::Green),});
          return window(text(L" Summary "), content);
        };
        return EXIT_SUCCESS;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++17", "-o", "test"
    system "./test"
  end
end
