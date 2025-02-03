module AES_encrypt #(
    parameter key_length = 128, Nk = 4 , Nr = Nk+6
) (
    input [0:127] plain_txt,
    input [key_length-1:0] key, 
    output [0:127] cipher_txt
);

//localparam Nb = 4;
wire [0 : (128 * (Nr + 1)) - 1] expanded_key ;
wire [0:127] new_state, new_state_loop;
wire [0:127] sub_out,sub_out_final;
wire [0:127] shift_out, shift_out_final;
wire [0:127] mix_out;

Key_Expansion #(.Nk(Nk)) key_exp_inst (
    .key(key),
    .expanded_key(expanded_key)
); 
AddRoundKey add_inst (
    .state(plain_txt),
    .round_key(expanded_key[0:127]),
    .new_state(new_state)
);

genvar i;
generate
    for (i = 1; i<Nr; i=i+1) begin
        subByte sub_inst(
            .in(new_state),
            .out(sub_out));

        ShiftRows #(.enc_dec(0)) shift_inst(
            .state(sub_out),
            .new_state(shift_out)
        );

        MixColumns #(.enc_dec(0)) mix_inst (
            .in(shift_out),
            .out(mix_out)        
        );
        AddRoundKey add_inst_2 (
            .state(mix_out),
            .round_key(expanded_key[i*128 +: 128]),
            .new_state(new_state_loop)        
        );
    end

    subByte sub_inst_2 (
        .in(new_state_loop),
        .out(sub_out_final)
    );
    ShiftRows #(.enc_dec(0)) shift_inst_2 (
        .state(sub_out_final),
        .new_state(shift_out_final)
    );
    AddRoundKey add_inst_3 (
        .state(shift_out_final),
        .round_key(expanded_key[(Nr)*128+:128]),
        .new_state(cipher_txt)        
    );
endgenerate


endmodule