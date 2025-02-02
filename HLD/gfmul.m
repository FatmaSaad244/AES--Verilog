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

function result = gfmul(a, b)
    % gfmul: Multiplies two bytes in GF(2^8)
    % Input:
    %   a, b - Bytes to multiply
    % Output:
    %   result - Product of a and b in GF(2^8)
    a = uint8(a);
    b = uint8(b);
    result = uint8(0);
    
    for i = 1:8
        if bitand(b, 1)
            result = bitxor(result, a);
        end
        % Check if a will overflow when shifted
        carry = bitand(a, 0x80); % Check if the high bit is set
        a = bitshift(a, 1); % Shift left by 1
        
        if carry
            a = bitxor(a, 0x1b); % XOR with irreducible polynomial x^8 + x^4 + x^3 + x + 1
        end
        b = bitshift(b, -1); % Shift right by 1
    end
 
endfunction
