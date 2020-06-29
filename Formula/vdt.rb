# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Vdt < Formula
  desc "The vdt mathematical library"
  homepage "https://github.com/dpiparo/vdt"
  url "https://github.com/dpiparo/vdt/archive/v0.4.3.tar.gz"
  sha256 "705674612ebb5c182b65a8f61f4d173eb7fe7cdeee2235b402541a492e08ace1"

  depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    mkdir "builddir" do
      args = std_cmake_args + %w[
        ../
      ]
      # -DBUILD_SHARED_LIBS=ON
      system "cmake", *args
      system "make", "install" # if this fails, try separate make/make install steps
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test vdt`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
