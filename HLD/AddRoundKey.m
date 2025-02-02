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

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} AddRoundKey (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: AK-47 <ahmed-kamel>
## Created: 2025-01-27

function state = AddRoundKey (state, roundKey)
    % AddRoundKey: Performs the AddRoundKey operation in AES
    % Inputs:
    %   state    - 4x4 matrix of bytes (current state)
    %   roundKey - 4x4 matrix of bytes (round key for this step)
    % Output:
    %   state    - 4x4 matrix of bytes (updated state after XOR with roundKey)

    % Perform bitwise XOR between the state and the round key
    state = bitxor(state, roundKey);
endfunction
