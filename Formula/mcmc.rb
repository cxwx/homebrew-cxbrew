# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mcmc.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/29 18:54:00 by chenxu            #+#    #+#              #
#    Updated: 2024/07/29 19:12:44 by chenxu           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# cspell:disable
class Mcmc < Formula
  desc "Lightweight C++ library of MCMC methods"
  homepage "https://github.com/kthohr/mcmc"
  url "https://github.com/kthohr/mcmc.git"
  version "0.0.1"
  head "https://github.com/kthohr/mcmc.git", branch: "master"

  depends_on "rsync" => :build
  depends_on "armadillo"
  depends_on "eigen"
  depends_on "libomp"
  depends_on "openblas"

  def install
    if OS.mac?
      system "sed", "-i.bak", "s/-fopenmp/-Xpreprocessor -fopenmp -lomp/g", "configure"
      system "mkdir", "-p", "#{prefix}/lib"
    end
    # system "export EIGEN_INCLUDE_PATH=/opt/homebrew/include/eigen3/"
    system "EIGEN_INCLUDE_PATH=/opt/homebrew/include/eigen3 ./configure -i #{prefix} -l eigen -p"
    # system "ARMA_INCLUDE_PATH=/opt/homebrew/include/armadillo ./configure -i #{prefix} -l amra -p"
    system "make"
    system "make", "install"
  end

end
