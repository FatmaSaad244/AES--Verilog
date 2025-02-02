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

function results = KeyExpansion(key, Nk)
    % KeyExpansion function for AES key schedule.
    % Inputs:
    % - key: Initial key (1x(4*Nk)) row vector.
    % - Nk: Number of 32-bit words in the key (e.g., 4 for AES-128).
    % Output:
    % - results: Expanded key schedule.

    % AES constants
    Nb = uint8(4); % Number of columns in the state (fixed at 4)
    Nr = uint8(Nk + 6); % Number of rounds (depends on Nk)
    Rcon = uint8([0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1B, 0x36]); % Round constants

    % Initialize the expanded key
    keySchedule = zeros(4, Nb * (Nr + 1));

    % Copy the input key into the first Nk words of the key schedule
    for i = 1:Nk
        keySchedule(:, i) = key((4 * (i - 1) + 1):(4 * i))';
    end

    % Expand the key
    for i = Nk:(Nb * (Nr + 1) - 1)
        temp = keySchedule(:, i);
        if mod(i, Nk) == 0
            temp = bitxor(SubWord(RotWord(temp))', [Rcon(floor(i / Nk)); 0; 0; 0]); %temp = SubWord(RotWord(temp))' + [Rcon(i / Nk); 0; 0; 0];
        elseif Nk > 6 && mod(i, Nk) == 4
            temp = SubWord(temp)';
        end
        keySchedule(:, i + 1) = bitxor(keySchedule(:, i - Nk + 1), temp);
    end

    results = keySchedule;
end