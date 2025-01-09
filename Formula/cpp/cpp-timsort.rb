class CppTimsort < Formula
  desc "A C++ implementation of timsort"
  homepage "A C++ implementation of timsort"
  url "https://github.com/timsort/cpp-TimSort/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "f44aa826f2add2f15cf44f6547ea1e233dae6638e3a5c502fe3b272e17efaaf2"
  license "MIT"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DBUILD_TESTING=OFF
    ]
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cpp-TimSort`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
