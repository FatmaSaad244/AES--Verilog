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

function state = MixColumns(state)
    % MixColumns: Performs the MixColumns operation in AES
    % Input:
    %   state - 4x4 matrix of bytes (current state)
    % Output:
    %   state - 4x4 matrix of bytes (updated state after MixColumns)
    
    state = uint8(state);

    % Fixed matrix for MixColumns
    mixMatrix = uint8([0x02, 0x03, 0x01, 0x01;
                       0x01, 0x02, 0x03, 0x01;
                       0x01, 0x01, 0x02, 0x03;
                       0x03, 0x01, 0x01, 0x02]);

    % Initialize the output state
    newState = zeros(4, 4, 'uint8');

    % Perform matrix multiplication in GF(2^8)
    for col = 1:4
        for row = 1:4
            % Multiply and accumulate in GF(2^8)
            newState(row, col) = ...
                bitxor(gfmul(mixMatrix(row, 1), state(1, col)), ...
                bitxor(gfmul(mixMatrix(row, 2), state(2, col)), ...
                bitxor(gfmul(mixMatrix(row, 3), state(3, col)), ...
                       gfmul(mixMatrix(row, 4), state(4, col)))));
        end
    end

    % Update the state
    state = newState;
endfunction
