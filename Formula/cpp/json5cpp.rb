class Json5cpp < Formula
  desc "C++ library for parsing and stringifying JSON5 data Resources"
  homepage "https://github.com/mqnc/json5cpp"
  license "MIT"
  head "https://github.com/mqnc/json5cpp.git", branch: "main"

  # depends_on "cmake" => :build

  def install
    args = %w[
    ]

    # system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    # system "cmake", "--build", "builddir"
    # system "cmake", "--install", "builddir"
    (include/"json5cpp").install Dir["src/*.hpp"]
  end

  test do
  end
end
