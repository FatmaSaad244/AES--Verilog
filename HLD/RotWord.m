## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.


## Author: AK-47 <ahmed-kamel>
## Created: 2025-01-28

function word_out = RotWord(word_in)
  % RotWord function for AES Key Expansion
  % Rotates a 4-byte word to the left by 1 byte
  % Input: word_in (1x4 vector of bytes)
  % Output: word_out (1x4 vector of rotated bytes)
  
  % Perform circular left shift by 1 byte
  word_out = circshift(word_in, -1);
end

