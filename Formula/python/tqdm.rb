class Tqdm < Formula
  include Language::Python::Virtualenv

  desc "Fast, extensible progress bar for Python"
  homepage "https://tqdm.github.io"
  url "https://github.com/tqdm/tqdm/archive/refs/tags/v4.68.4.tar.gz"
  sha256 "55284af7a740467e17418255735615e8ca8eaa7aeb4dc137e1f6b339ccaec17a"
  license "MIT"

  depends_on "python@3.14"

  def install
    # tqdm 用 setuptools-scm 从 git tag 生成 version;GitHub archive 无 .git 会 build 失败,
    # 故用 formula version 假装(等价于 PyPI sdist 里预写入的 version)。
    ENV["SETUPTOOLS_SCM_PRETEND_VERSION"] = version
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages("python3")/"homebrew-tqdm.pth").write venv.site_packages
  end

  test do
    system "python3", "-c", "import tqdm; print(tqdm.__version__)"
  end
end
