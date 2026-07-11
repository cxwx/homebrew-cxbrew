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

    # setuptools-scm 10.x 用 vcs-versioning 探测自身版本,从 sdist 源码构建时探测不到
    # (无 git 元数据),且 pretend 版本必须与解析到的 sdist 版本完全一致,否则 pip 判定
    # 版本不一致而丢弃。用 build-constraint 把 setuptools-scm 钉到固定版本,再配上与之
    # 匹配的 pretend 版本,使 pip 隔离构建 tqdm 时能成功构建这个 build 依赖。
    (buildpath/"build-constraints.txt").write "setuptools-scm==10.2.0\n"
    ENV["PIP_BUILD_CONSTRAINT"] = (buildpath/"build-constraints.txt").to_s
    ENV["SETUPTOOLS_SCM_PRETEND_VERSION_FOR_SETUPTOOLS_SCM"] = "10.2.0"

    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages("python3")/"homebrew-tqdm.pth").write venv.site_packages
  end

  test do
    system "python3", "-c", "import tqdm; print(tqdm.__version__)"
  end
end
