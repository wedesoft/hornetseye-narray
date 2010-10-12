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
class NArray

  def to_multiarray
    case typecode
    when BYTE
      target = Hornetseye::UBYTE
    when SINT
      target = Hornetseye::SINT
    when INT
      target = Hornetseye::INT
    when SFLOAT
      target = Hornetseye::SFLOAT
    when DFLOAT
      target = Hornetseye::DFLOAT
    when SCOMPLEX
      target = Hornetseye::SCOMPLEX
    when DCOMPLEX
      target = Hornetseye::DCOMPLEX
    when OBJECT
      target = Hornetseye::OBJECT
    else
      raise "Unknown NArray typecode " + typecode
    end
    if target == Hornetseye::OBJECT
      Hornetseye::MultiArray( target, *shape )[ *to_a ]
    else
      Hornetseye::MultiArray.import target, to_s, *shape
    end
  end

end

