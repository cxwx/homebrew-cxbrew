class Ctools < Formula
  desc "Software package for analysis of CTA data"
  homepage "http://cta.irap.omp.eu/ctools/about.html"
  url "http://cta.irap.omp.eu/ctools/releases/ctools/ctools-1.7.0.tar.gz"
#  sha256 "7361351ef95be8f949815a0006df0867fda72c6a0ee6b9956b5340b3ae29764b"

  depends_on "doxygen"
  depends_on "gammalib"
  depends_on "python@3.8"
  depends_on "swig"

  def install
#    system "./configure", "PYTHON=/usr/local/bin/python3", "--prefix=#{prefix}"
#    system "export GAMMALIB=/usr/local/Cellar/gammalib/1.7.0/"
#    system ". $GAMMALIB/bin/gammalib-init.sh"
    system "./configure", "PYTHON=#{Formula["python@3.8"].opt_bin}/python3", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  def caveats; <<~EOS
    1, You should set gammalib env before building see gammalib.
    2, set env after install
      export CTOOLS=/usr/local
      source $CTOOLS/bin/ctools-init.sh
  EOS
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <gammalib/GSkyMap.hpp>
      #include <iostream>
      int main() {
      	GSkyDir dir;
	      dir.radec_deg(83.63,22.01);
	      double l = dir.l_deg();
	      std::cout << l << std::endl;
      }
    EOS
    system ENV.cxx, "-std=c++11", "test.cpp", "-o", "test", "-I#{include}",
                    "-L#{lib}", "-lgamma"
    assert_match /184.56/, shell_output("./test")
  end
end
