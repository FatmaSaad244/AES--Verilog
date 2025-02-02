`timescale 1ns / 1ps

module Key_Expansion_TB;

    parameter Nk = 8;  
    parameter Nr = Nk + 6; 

    reg [0 : (Nk * 32) - 1] key;
    wire [0 : (128 * (Nr + 1)) - 1] expanded_key;


    Key_Expansion #(Nk, Nr) dut (
        .key(key),
        .expanded_key(expanded_key)
    );

    initial begin

        key =  256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        
        #20;
        $display("Expanded Key: %h", expanded_key);

        #10;
        $finish;
    end

endmodule
