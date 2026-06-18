class ClangTidy < Formula
  desc "Clang-tidy is an LLVM-based code analyser tool"
  homepage "https://clang.llvm.org/extra/"
  # 纯 shim:clang-tidy 二进制完全由 formula "llvm" 提供(llvm 是 keg-only,默认不在 PATH)。
  # 本 formula 仅把它的 clang-tidy symlink 到 PATH,自身不编译任何东西。
  # head 是 Homebrew 对源码的强制要求(每个 formula 必须有 url 或 head),这里指向 clang-tidy
  # 打包仓库仅作占位;install 实际只依赖 llvm,不会构建 head 的内容。
  # 版本跟随 llvm:`brew upgrade llvm` 即更新 clang-tidy,本 formula 永不需要 bump。
  head "https://github.com/ssciwr/clang-tidy-wheel.git", branch: "main"
  license "Apache-2.0"

  depends_on "llvm"

  def install
    bin.install_symlink Formula["llvm"].opt_bin/"clang-tidy"
  end

  def caveats
    <<~EOS
      clang-tidy 实际由 formula "llvm" 提供,本 formula 只把它加入 PATH。
      版本跟随 llvm:`brew upgrade llvm` 即更新,无需重装本 formula。
      head-only,安装请用:`brew install --HEAD clang-tidy`。
    EOS
  end

  test do
    system "#{bin}/clang-tidy", "--version"
  end
end
