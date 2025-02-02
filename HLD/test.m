% Example state matrix (4x4 matrix of bytes in hexadecimal format)
state = [0x85 0x6e 0x61 0x3c;
         0x19 0x13 0xe0 0x82;
         0xbc 0x26 0x85 0xea;
         0xed 0x8f 0xf6 0xc2];

% Example round key (4x4 matrix of bytes in hexadecimal format)
roundKey = [0x2b 0x28 0xab 0x09;
            0x7e 0xae 0xf7 0xcf;
            0x15 0xd2 0x15 0x4f;
            0x16 0xa6 0x88 0x3c];

##newState = AddRoundKey(state, roundKey);
##disp('New State after AddRoundKey:');
##disp(newState);
##
##newState = SubBytes(state);
##disp('New State after SubBytes:');
##disp(newState);
##
##newState = ShiftRows(state);
##disp('New State after ShiftRows:');
##disp(newState);
##
##newState = MixColumns(state);
##disp('New State after MixColumns:');
##disp(newState);

##word = [0xcf; 0x4f; 0x3c; 0x09];
##substituted_word = SubWord(word);
##disp(dec2hex(substituted_word));

##word = [0x09 0xcf 0x4f 0x3c];
##rotated_word = RotWord(word);
##disp(dec2hex(rotated_word));

##roundKeys = KeyExpansion(roundKey, Nk);
##disp(roundKeys);

##word_sub = SubWord([0x19, 0xa0, 0x9a, 0xe9]);
##word_insub = InvSubWord(word_sub);
##
##disp("Input word: ");
##disp(word_sub);
##disp("Output word: ");
##disp(word_insub);

##state_in = [
##    0xdb, 0xf2, 0xcf, 0xd4;
##    0x13, 0x0a, 0xc7, 0x0a;
##    0x53, 0x22, 0x96, 0xcf;
##    0x45, 0x5c, 0x31, 0x97
##];
##
##state_mixed = MixColumns(state_in);
##state_original = InvMixColumns(state_mixed);
##% Display the result
##disp("Input state:");
##disp(state_mixed);
##disp("Output state:");
##disp(state_original);

##state = [
##    0x63, 0x09, 0xcd, 0xba;
##    0x09, 0xcd, 0xba, 0x63;
##    0xcd, 0xba, 0x63, 0x09;
##    0xba, 0x63, 0x09, 0xcd
##];
##
##out_shifted = ShiftRows(state);
##
##disp("Original State:");
##disp(out_shifted);
##
##inv_state = InvShiftRows(out_shifted);
##
##disp("State after InvShiftRows:");
##disp(inv_state);

##state = [
##    0x7a, 0x89, 0x2b, 0x3d;
##    0xaf, 0x56, 0x43, 0x12;
##    0xde, 0xac, 0x67, 0xef;
##    0x1f, 0x75, 0x92, 0x3a
##];
##
##state_sub = SubByte(state);
## 
##disp("Original State:");
##disp(state_sub);
##
##state_inv = InvSubBytes(state_sub);
##
##disp("State after InvSubBytes:");
##disp(state_inv);

word_in = RotWord([0x12, 0x34, 0x56, 0x78]);

disp("Original Word:");
disp((word_in));

word_out = InvRotWord(word_in);

disp("Rotated Word (InvRotWord):");
disp((word_out));