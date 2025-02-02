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

function state_out = InvMixColumns(state_in)
    % The fixed matrix for InvMixColumns
    inv_mix_matrix = [
        0x0e, 0x0b, 0x0d, 0x09;
        0x09, 0x0e, 0x0b, 0x0d;
        0x0d, 0x09, 0x0e, 0x0b;
        0x0b, 0x0d, 0x09, 0x0e
    ];

    % Initialize the output state matrix
    state_out = zeros(4, 4, 'uint8');

    % Apply InvMixColumns transformation to each column
    for c = 1:4
        column = state_in(:, c); % Extract the c-th column
        new_column = zeros(4, 1, 'uint8');
        for i = 1:4
            % Perform GF(2^8) multiplication for each row of the matrix
            new_column(i) = ...
                bitxor(bitxor(bitxor( ...
                    gfmul(inv_mix_matrix(i, 1), column(1)), ...
                    gfmul(inv_mix_matrix(i, 2), column(2))), ...
                    gfmul(inv_mix_matrix(i, 3), column(3))), ...
                    gfmul(inv_mix_matrix(i, 4), column(4)));
        end
        state_out(:, c) = new_column; % Replace the column in the output state
    end
endfunction