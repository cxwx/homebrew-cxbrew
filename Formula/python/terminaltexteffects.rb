class Terminaltexteffects < Formula
  include Language::Python::Virtualenv

  desc "Visual effects in the terminal"
  homepage "https://github.com/ChrisBuilds/terminaltexteffects"
  url "https://files.pythonhosted.org/packages/3c/df/4fa04990d75cc27215159bf9edec7d56546fd72e1927c5753d0de0414e7b/terminaltexteffects-0.15.0.tar.gz"
  sha256 "f4b31c86bfa943d5bf3b2c5ecbfaea0de65ed4a951028c40f8e4cb54efd06439"
  license "MIT"
  head "https://github.com/ChrisBuilds/terminaltexteffects.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "usage", shell_output("#{bin}/tte --help")
  end
end
