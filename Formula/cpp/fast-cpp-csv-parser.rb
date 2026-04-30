class FastCppCsvParser < Formula
  desc "a small, easy-to-use and fast header-only library for reading comma separated value (CSV) files"
  homepage "https://github.com/ben-strasser/fast-cpp-csv-parser"
  head "https://github.com/ben-strasser/fast-cpp-csv-parser.git", branch: "master"
  sha256 "fc70d17a0c41ecfa62ea24f8bb20a6d6ef329a36da0929b26e39575263248c69"

  def install
    (include/"fast-cpp-csv-parser").mkpath
    include.install "csv.h" => "fast-cpp-csv-parser/csv.h"
  end
end
