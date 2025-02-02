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

function state = InvShiftRows(state)
    % InvShiftRows for AES decryption
    % Input: state - a 4x4 matrix (state matrix for AES)
    % Output: state - a 4x4 matrix after inverse row shifts

    % Row 1: Shift right by 1
    state(2, :) = circshift(state(2, :), [0, 1]);

    % Row 2: Shift right by 2
    state(3, :) = circshift(state(3, :), [0, 2]);

    % Row 3: Shift right by 3
    state(4, :) = circshift(state(4, :), [0, 3]);

    % Row 0 remains unchanged (no shift needed)
endfunction
