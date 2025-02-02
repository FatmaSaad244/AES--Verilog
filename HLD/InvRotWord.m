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
## Created: 2025-01-29

function word_out = InvRotWord(word_in)
    % InvRotWord for AES decryption
    % Input: word_in - a 1x4 array representing a 4-byte word
    % Output: word_out - a 1x4 array after rotating the word one byte to the right

    % Perform a circular shift to the right by 1 byte
    word_out = circshift(word_in, [0, 1]);
endfunction
