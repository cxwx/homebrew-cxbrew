class Naima < Formula
  include Language::Python::Virtualenv

  desc "Derivation of non-thermal particle distributions through MCMC spectral fitting"
  homepage "https://github.com/zblz/naima"
  url "https://files.pythonhosted.org/packages/9e/0c/6f29478255258f5ed24a7194e2144c48f5084f559d5ae089f3e2f53cba53/naima-0.10.4.tar.gz"
  sha256 "c9abb544ee547db34d9678b16641c48fb36d9acf52871952ca133b7c98fe2ae8"
  license "BSD-3-Clause"

  depends_on "numpy"
  depends_on "python@3.14"

  resource "astropy" do
    url "https://files.pythonhosted.org/packages/0e/c4/21be4313ddfde5f60e0607fd307f367b9e0f0bf153a89b10cbd036dd8cfd/astropy-8.0.1.tar.gz"
    sha256 "45ca31d5b91fa294cd590a4791a32db94de7f9c8a343155f4d5877baa82351da"
  end

  resource "astropy-iers-data" do
    url "https://files.pythonhosted.org/packages/89/59/cf5b6457636c95e8a640427ad289e0fdc09ec054ab3bf74c4dba8eaa5f6d/astropy_iers_data-0.2026.9.7.0.56.14.tar.gz"
    sha256 "eb7f05464ab43603ff3cddbfbf2fe3c6abc925fe5dd0f268d95d7f8872cf4fe7"
  end

  resource "contourpy" do
    url "https://files.pythonhosted.org/packages/58/01/1253e6698a07380cd31a736d248a3f2a50a7c88779a1813da27503cadc2a/contourpy-1.3.3.tar.gz"
    sha256 "083e12155b210502d0bca491432bb04d56dc3432f95a979b429f2848c3dbe880"
  end

  resource "corner" do
    url "https://files.pythonhosted.org/packages/4f/06/0d045530fa994ab450f6a98b7ad9f74c90a8abf5271d3690f60d1aa933d8/corner-2.3.0.tar.gz"
    sha256 "685ecb1e778809b78c6783f4a4691d023bbd9f781c9efda683c2b793878b561c"
  end

  resource "cycler" do
    url "https://files.pythonhosted.org/packages/a9/95/a3dbbb5028f35eafb79008e7522a75244477d2838f38cbb722248dabc2a8/cycler-0.12.1.tar.gz"
    sha256 "88bb128f02ba341da8ef447245a9e138fae777f6a23943da4540077d3601eb1c"
  end

  resource "emcee" do
    url "https://files.pythonhosted.org/packages/cb/53/1045ee878cb24281387079f8ee4f0ade1622c6aae1ed1fd91a53e4fa5b19/emcee-3.1.6.tar.gz"
    sha256 "11af4daf6ab8f9ca69681e3c29054665db7bbd87fd4eb8e437d2c3a1248c637d"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/77/51/d63c7e52163ac14393a35bd14bd7c0da95f8f74be5d7cc988092f9965129/fonttools-4.65.0.tar.gz"
    sha256 "762ba5431358d0dbd4a01982484a1d494fb267e91f974cdcf20b80eab8560f6f"
  end

  resource "h5py" do
    url "https://files.pythonhosted.org/packages/db/33/acd0ce6863b6c0d7735007df01815403f5589a21ff8c2e1ee2587a38f548/h5py-3.16.0.tar.gz"
    sha256 "a0dbaad796840ccaa67a4c144a0d0c8080073c34c76d5a6941d6818678ef2738"
  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/ba/07/bd78e6a8fae171ea041ef5bba3ed21a003522fa088834b069b1909981f30/kiwisolver-1.5.1.tar.gz"
    sha256 "f1303ef2eec81262a4b708c3e858afe58d7c75ad91c1c05266eda7673369859a"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/49/64/f9a391af28f518b11ad45a8a712353c94a0aefce09d3703200e5c54b610a/matplotlib-3.11.1.tar.gz"
    sha256 "69647db5746941c793d6e445a4cd349323ffb87d9cc958c2ad84a659b4832d30"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/13/01/11703282db468b85f6f7b8c7f22d058de5970d5c7e60a3a8aaa313c3de36/numpy-2.5.3.tar.gz"
    sha256 "df2d5874ff183595a4ba404edd04f6bd9b5505c1d7708573f6a6c17489a67563"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/7d/fa/3944b40b07da9ce895c0e6303a5ab7d53da063554f534556b134a54d6093/packaging-26.3.tar.gz"
    sha256 "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1c/3d/bb7fca845737cf9d7dbde16ed1843984665ff2e0a518f5db43e77ec540b9/pillow-12.3.0.tar.gz"
    sha256 "3b8182a766685eaa002637e28b4ec8d6b18819a0c71f579bf0dbaa5830297cce"
  end

  resource "pyerfa" do
    url "https://files.pythonhosted.org/packages/71/39/63cc8291b0cf324ae710df41527faf7d331bce573899199d926b3e492260/pyerfa-2.0.1.5.tar.gz"
    sha256 "17d6b24fe4846c65d5e7d8c362dcb08199dc63b30a236aedd73875cc83e1f6c0"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f/pyparsing-3.3.2.tar.gz"
    sha256 "c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "scipy" do
    url "https://files.pythonhosted.org/packages/7e/74/66de6258867beb2ef08f35f9f2ac017a52cacd5081714d239ff1a442d458/scipy-1.18.1.tar.gz"
    sha256 "52c4b7422442aba924d03ad4019852b08a92e64ea187b933135687bfe2747307"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages("python3")/"homebrew-naima.pth").write venv.site_packages
  end

  test do
    system "python3", "-c", "import naima"
  end
end
