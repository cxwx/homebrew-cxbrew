# *************************************************************************** #
#                                                                             #
#                                                        :::      ::::::::    #
#    gplotpp.rb                                        :+:      :+:    :+:    #
#                                                    +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>          +#+  +:+       +#+         #
#                                                +#+#+#+#+#+   +#+            #
#    Created: 2025/02/06 19:55:55 by chenxu           #+#    #+#              #
#    Updated: 2025/02/06 20:02:20 by chenxu          ###   ########.fr        #
#                                                                             #
# *************************************************************************** #
# cspell:disable
class Gplotpp < Formula
  desc "A header-only C++ library that interfaces with Gnuplot"
  homepage "https://github.com/ziotom78/gplotpp"
  head "https://github.com/ziotom78/gplotpp.git", branch: "master"

  def install
    include.install "gplot++.h"
  end
end
