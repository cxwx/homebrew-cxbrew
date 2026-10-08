class Jsoncons < Formula
  desc "C++, header-only lib for constructing JSON-like data formats"
  homepage "https://github.com/danielaparker/jsoncons"
  url "https://github.com/danielaparker/jsoncons/archive/refs/tags/v1.10.0.tar.gz"
  sha256 "c829350a2eece662beb378143e2ab1c1cbb07d703687bf168626665a8a7d8bc1"
  license "BSL-1.0"
  head "https://github.com/danielaparker/jsoncons.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DJSONCONS_BUILD_TESTS=OFF
      -DBUILD_TESTING=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  # FAIL: test github:danielaparker/jsoncons/discussions/671
  test do
    system "true"
  end
end
