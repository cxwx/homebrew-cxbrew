# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftxui.rb                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/08 01:41:10 by chenxu            #+#    #+#              #
#    Updated: 2025/01/08 01:43:39 by chenxu           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# cspell:disable
class ReflectCpp < Formula
  desc "A C++20 library for fast serialization, deserialization and validation using reflection."
  homepage "https://github.com/getml/reflect-cpp"
  url "https://github.com/getml/reflect-cpp/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "08b6406cbe4c6c14ff1a619fe93a94f92f6d9eb22213d93529ad975993945e45"
  head "https://github.com/getml/reflect-cpp.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "make" => :build
  # depends_on "vcpkg" => :build
  # TODO: add support: https://github.com/getml/reflect-cpp?tab=readme-ov-file#serialization-formats
  depends_on "tomlplusplus"
  depends_on "yaml-cpp"
  depends_on "pugixml"
  depends_on "yyjson" # ?
  # BUG: janssonConfig.cmake not installed
  # depends_on "avro-c"

  def install
    args = std_cmake_args + %w[
      -DCMAKE_MAKE_PROGRAM=gmake
      -DREFLECTCPP_JSON=ON
      -DREFLECTCPP_YAML=ON
      -DREFLECTCPP_USE_VCPKG=OFF
      -DREFLECTCPP_TOML=ON
      -DREFLECTCPP_XML=ON
      -DREFLECTCPP_AVRO=OFF
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
