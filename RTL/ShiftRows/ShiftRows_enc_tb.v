`timescale 1ns / 1ps

module ShiftRows_enc_tb;
    parameter enc_dec = 0;
    reg [0:127] state;
    wire [0:127] new_state;

    ShiftRows #(enc_dec) uut (
        .state(state),
        .new_state(new_state)
    );

    reg [127 : 0] MEM [0:5];
     integer i;
    initial begin
        $readmemh("test_cases.mem",MEM);
        # 10;
        $display("----------Encryption start------------");
        for (i=0 ; i<6 ; i=i+2) begin
            state = MEM[i];
            #1;
            $display("The input is        : %0h", state);
            $display("The expected output : %0h", MEM[i+1]);
            $display("The actual output   : %0h", new_state);
            if (new_state == MEM[i+1])
                $display("test case %h: PASSED ",i);
            else
                $display("test case %h: FAILED  ",i);
        end
        $finish;
    end
endmodule