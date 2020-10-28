//Test Bench for ALU
`include "ALU.v"

module ALU_TB();

reg [7:0] a, b;
reg C_IN;
reg [2:0] CONTROL_LINE;
reg MODE_SELECT;

wire [7:0]OUT;
wire C_OUT;
integer i;
integer j;
//Creating ALU instant
ALU i1
(
    .A(a),
    .B(b),
    .c_in(C_IN),
    .control_line(CONTROL_LINE),
    .mode_select(MODE_SELECT),
    .out(OUT),
    .c_out(C_OUT)
);

initial 
begin
    $monitor($time, "  a = %b b = %b cin = %b ::  out = %b  cout = %b  :: mode = %b control_word = %b", a, b, C_IN, OUT, C_OUT, MODE_SELECT, CONTROL_LINE);
    $dumpfile("a.vcd");
    $dumpvars(0, ALU_TB);
end

initial
begin
    a = 8'd2; b = 8'd3; C_IN = 0;
    MODE_SELECT = 1;
    CONTROL_LINE = 3'd0;
    for(i = 0; i < 2; i++)
    begin
    #5  MODE_SELECT = i; CONTROL_LINE = 3'd0;
        for(j = 1; j < 8; j++)
            #5 CONTROL_LINE = j;
    end
    #5  $finish;
end
endmodule