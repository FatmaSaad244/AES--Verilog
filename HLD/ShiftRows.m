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

function state = ShiftRows(state)
    % ShiftRows: Performs the ShiftRows operation in AES
    % Input:
    %   state - 4x4 matrix of bytes (current state)
    % Output:
    %   state - 4x4 matrix of bytes (updated state after shifting rows)

    % Shift each row cyclically to the left
    state(2, :) = circshift(state(2, :), -1); % Row 1: Shift left by 1 byte
    state(3, :) = circshift(state(3, :), -2); % Row 2: Shift left by 2 bytes
    state(4, :) = circshift(state(4, :), -3); % Row 3: Shift left by 3 bytes

endfunction
