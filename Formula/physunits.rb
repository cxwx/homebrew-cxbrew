class Physunits < Formula
  desc "A small C++11, C++14 header-only library for compile-time dimensional analysis and unit/quantity manipulation and conversion"
  homepage "https://github.com/martinmoene/PhysUnits-CT-Cpp11"
  url "https://codeload.github.com/martinmoene/PhysUnits-CT-Cpp11/zip/master"
  version "1.1.0"
  sha256 "8a4974e816e576f55e5e6b27874c364ae6181405911b864edd0912402c3066ae"

  depends_on "cmake" => :build

  def install
    mkdir "phys-build" do
      args = std_cmake_args + %w[
        ../
      ]

      system "cmake", *args
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <phys/units/quantity.hpp>
      #include <iostream>
      using namespace std;
      using namespace phys::units;
      using namespace phys::units::literals;

      int main()
      {
        quantity<speed_d> speed = 45_km / hour;
        cout<<speed.magnitude()<<endl;
      }
    EOS
    system ENV.cxx, "-std=c++11", "test.cpp", "-o", "test", "-I#{include}"
    assert_match /12.5/, shell_output("./test")
  end

end
