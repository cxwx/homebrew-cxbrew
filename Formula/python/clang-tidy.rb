class ClangTidy < Formula
  include Language::Python::Virtualenv

  desc "Clang-tidy is an LLVM-based code analyser tool"
  homepage "https://pypi.org/project/clang-tidy/"
  url "https://files.pythonhosted.org/packages/49/10/40a7328ed7903ee52d2f23ba033fb1147b1ed2f5ccbdef893d44d639aac8/clang_tidy-22.1.0.1.tar.gz"
  sha256 "acc00c84a8f4d17d6c07697551fae9ed549f41dd54433d842f830e1e0d15e64e"
  license "Apache-2.0"

  depends_on "llvm"
  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  def install
    venv = virtualenv_create(libexec, python3)

    # Install only the Python wrapper module, skip CMake/LLVM build
    sp = venv.site_packages
    (sp/"clang_tidy").install buildpath/"clang_tidy/__init__.py"

    # Symlink Homebrew's clang-tidy into the package's expected location
    bin_dir = sp/"clang_tidy/data/bin"
    bin_dir.mkpath
    ln_sf Formula["llvm"].opt_bin/"clang-tidy", bin_dir/"clang-tidy"

    # Write dist-info so pip recognizes the package
    dist_info = sp/"clang_tidy-22.1.0.1.dist-info"
    dist_info.mkpath
    (dist_info/"METADATA").write <<~EOS
      Metadata-Version: 2.1
      Name: clang-tidy
      Version: 22.1.0.1
      Summary: Clang-tidy is an LLVM-based code analyser tool
      License: Apache 2.0
    EOS
    (dist_info/"RECORD").write ""
    (dist_info/"INSTALLER").write "homebrew"

    bin.install_symlink bin_dir/"clang-tidy"
    (prefix/Language::Python.site_packages(python3)/"homebrew-clang-tidy.pth").write sp
  end

  test do
    system python3, "-c", "import clang_tidy; clang_tidy.clang_tidy()"
  end
end
