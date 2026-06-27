class Blue < Formula
  include Language::Python::Virtualenv

  desc "Slightly less uncompromising Python code formatter"
  homepage "https://blue.readthedocs.io"
  url "https://files.pythonhosted.org/packages/68/5a/ef15e7accbe49dbeeb8e7c01e13b8459006c6fed4db8fe833f2ae4924fd7/blue-0.9.1.tar.gz"
  sha256 "76b4f26884a8425042356601d80773db6e0e14bebaa7a59d7c54bf8cef2e2af5"
  license "Apache-2.0"
  head "https://github.com/grantjenks/blue.git", branch: "master"

  livecheck do
    url :stable
    strategy :pypi
  end

  # blue pins black==22.1.0, whose AST stability/equivalence checks crash on
  # Python 3.11+, so pin python@3.10 for a formatter that actually works.
  depends_on "python@3.10"

  def python3
    which("python3.10")
  end

  # blue pins its runtime dependency on black (==22.1.0), so install it and
  # use prebuilt wheels instead of the default dependency-free, source-only build.
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/blue"
  end

  test do
    (testpath/"test.py").write("x=1+2\n")
    system bin/"blue", testpath/"test.py"
    assert_equal "x = 1 + 2\n", (testpath/"test.py").read
  end
end
