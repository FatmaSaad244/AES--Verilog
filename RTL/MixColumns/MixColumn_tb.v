module MixColumns_encr_tb ;
    parameter enc_dec = 0;
    reg [0 : 127] in;
    wire [0 : 127] out;

    integer i;
    MixColumns #(enc_dec) DUT (.*); 

    reg [127 : 0] mem [0:17];

    initial begin
        $readmemh("test_vector.txt",mem);
        # 10;
        $display("##########################################################");
        $display("##################### Encryption #########################");
        $display("##########################################################");
        for (i=0 ; i<18 ; i=i+2) begin
            in = mem[i];
            #1;
            $display("The input is        : %0h", in);
            $display("The expected output : %0h", mem[i+1]);
            $display("The actual output   : %0h", out);
            if (out == mem[i+1])
                $display("PASSED --------------------------- ");
            else
                $display("FAILED --------------------------- ");
        end
        $stop;
        
    end
endmodule
// #################################################################################
// #################################################################################
// #################################################################################
module MixColumns_decr_tb ;
    parameter enc_dec = 1;
    reg [0 : 127] in;
    wire [0 : 127] out;

    integer i;
    MixColumns #(enc_dec) DUT (.*); 

    reg [127 : 0] mem [0:17];

    initial begin
        $readmemh("test_vector.txt",mem);
        # 10
        $display("##########################################################");
        $display("##################### Decryption #########################");
        $display("##########################################################");
        for (i=17; i>=0 ; i=i-2) begin
            in = mem[i];
            #1;
            $display("The input is        : %0h",in);
            $display("The expected output : %0h", mem[i-1]);
            $display("The actual output   : %0h", out);
            if (out == mem[i-1])
                $display("PASSED --------------------------- ");
            else
                $display("FAILED --------------------------- ");
        end

        $stop;
        
    end

endmodule