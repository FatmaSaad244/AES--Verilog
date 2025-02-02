module SubByte_tb;
reg  [0:127]  in;
wire [0:127] out;

subByte sb(in,out);

initial begin
$monitor("input= %h ,output= %h",in,out);
//inputs from standard page 40
in=128'h00102030405060708090a0b0c0d0e0f0;
#10;
in=128'h89d810e8855ace682d1843d8cb128fe4;
#10;
in=128'h4915598f55e5d7a0daca94fa1f0a63f7;
#10;
$finish;
end

endmodule
