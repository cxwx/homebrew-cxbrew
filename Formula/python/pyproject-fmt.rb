class PyprojectFmt < Formula
  include Language::Python::Virtualenv

  desc "Format your pyproject.toml file"
  homepage "https://github.com/tox-dev/toml-fmt"
  url "https://files.pythonhosted.org/packages/4c/f8/511b146850b0fa9de0b5e3a8094ec6022d8d467412c6c744415277c5ad68/pyproject_fmt-2.27.1.tar.gz"
  sha256 "e670cd95d98e43f0a475e10ad841e0796ed5b854eca0e96009e8fa12c2b9632d"
  license "MIT"
  head "https://github.com/tox-dev/toml-fmt.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "rust" => :build
  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # The formatter ships a Rust core (pyo3) compiled by maturin, the PEP 517
  # build backend declared in pyproject.toml. Keep build isolation on so pip
  # fetches maturin itself, and allow prebuilt wheels instead of the default
  # source-only build. cargo comes from the rust formula.
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/pyproject-fmt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pyproject-fmt --version")
  end
end
