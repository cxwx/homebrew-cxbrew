# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    createmodel_c_x.rb                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/09 19:29:29 by chenxu            #+#    #+#              #
#    Updated: 2025/01/09 19:29:30 by chenxu           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# cspell:disable
# TODO: shared libs
class Wavelib < Formula
  desc "C Implementation of 1D and 2D Wavelet Transforms (DWT,SWT and MODWT) along with 1D Wavelet packet Transform and 1D Continuous Wavelet Transform. "
  homepage "https://github.com/rafat/wavelib"
  head "https://github.com/rafat/wavelib.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "make" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
      -DBUILD_SHARED_LIBS=ON
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
