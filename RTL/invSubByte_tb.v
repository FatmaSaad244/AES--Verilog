module invSubByte_tb;
reg [0:127] in;
wire [0:127]out;

invSubByte invsb(in,out);

initial begin
$monitor("input= %h ,output= %h",in,out);
//input from standard page 49
in=128'haa5ece06ee6e3c56dde68bac2621bebf;
#10;

$finish;
end

endmodule
