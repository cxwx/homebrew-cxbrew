class PyprojectFmt < Formula
  include Language::Python::Virtualenv

  desc "Format your pyproject.toml file"
  homepage "https://github.com/tox-dev/toml-fmt"
  url "https://files.pythonhosted.org/packages/17/a0/25701dec063b07d47da580b490d996099e5c9fc24d61ab380be6d8c4bf3b/pyproject_fmt-2.25.2.tar.gz"
  sha256 "7a39a5dc9cd37c9006cdd9c0687b7d6cde7f63dafe37154e1f3e373e112a2c9b"
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
