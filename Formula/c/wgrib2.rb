class Wgrib2 < Formula
  desc "Read, write, and manipulate GRIB2 files"
  homepage "https://github.com/NOAA-EMC/wgrib2"
  url "https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v3.8.0.tar.gz"
  sha256 "39faebada36da5457c75f0980bb68fa299b221b3e6b335bb7d29006a35830c54"
  license "GPL-2.0-or-later"
  head "https://github.com/NOAA-EMC/wgrib2.git", branch: "develop"

  # Per LICENSE-wgrib2 the code is public-domain, GPL-2.0-or-later, or
  # Apache-2.0 (only decenc_openjpeg.c, which the default build omits);
  # conda-forge standardizes on GPL-2.0-or-later. The default CMake build
  # bundles the public-domain gctpc/g2clib; JPEG2000/PNG/AEC/NetCDF support
  # needs libs not packaged here (USE_G2CLIB_*, USE_NETCDF, USE_AEC, all off).
  depends_on "cmake" => :build
  depends_on "make" => :build

  def install
    # wgrib2 records @CMAKE_C_COMPILER@ into config.h (compiled into the
    # -config string) and the installed wgrib2_meta.h. Under Homebrew
    # superenv that is the shims dir, so drop the path and keep only the
    # compiler family/version (e.g. "v21.0.0.21000101 id:AppleClang").
    %w[wgrib2/config.h.in wgrib2/wgrib2_meta.h.in].each do |tmpl|
      inreplace tmpl, "@CMAKE_C_COMPILER@ ", ""
    end

    system "cmake", "-S", ".", "-B", "builddir",
           "-DBUILD_TESTING=OFF",
           *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    # wgrib2 returns exit code 8 for info/help paths (no GRIB processed);
    # exit 0 means a file was processed successfully.
    assert_match version.to_s, shell_output("#{bin}/wgrib2 -version", 8)
  end
end
