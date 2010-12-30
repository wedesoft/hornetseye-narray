# hornetseye-narray - NArray integration for Hornetseye
# Copyright (C) 2010 Jan Wedekind
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
module Hornetseye

  class Node

    def to_narray
      case typecode
      when UBYTE
        target = NArray::BYTE
      when SINT
        target = NArray::SINT
      when INT
        target = NArray::INT
      when SFLOAT
        target = NArray::SFLOAT
      when DFLOAT
        target = NArray::DFLOAT
      when SCOMPLEX
        target = NArray::SCOMPLEX
      when DCOMPLEX
        target = NArray::DCOMPLEX
      else
        target = NArray::OBJECT
      end
      if target == NArray::OBJECT
        NArray.to_na to_a
      else
        data = memorise.memory
        NArray.to_na memorise.memory.export, target, *shape
      end
    end

  end

end

