class Json5cpp < Formula
  desc "C++ library for parsing and stringifying JSON5 data Resources"
  homepage "https://github.com/mqnc/json5cpp"
  license "MIT"
  head "https://github.com/mqnc/json5cpp.git", branch: "main"

  def install
    (include/"json5cpp").install Dir["src/*.hpp"]
  end

  test do
    system "true"
  end
end
