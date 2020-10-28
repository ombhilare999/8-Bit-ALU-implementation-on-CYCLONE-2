//Verilog Code for 8 bit ALU.
//Omkar Bhilare, 191060901

module ALU( A, B, c_in, control_line, mode_select, out, c_out);

input [7:0] A, B;    		//8 Bit input A and B
input c_in;						//C in input 
input [2:0] control_line;  //3 Bit control line for selecting ALU operation
input mode_select;  			//Mode = 1 = ARITHMETIC :: Mode = 0 = LOGICAL

output reg c_out;				   //C out output for arithmetic 
output reg [7:0] out;      //8 Bit output reg

always@(*)
begin
    if(mode_select)
    begin
       case(control_line)
            3'd0 :  {c_out, out} = A + B + c_in;
            3'd1 :  {c_out, out} = A - B - c_in;
            3'd2 :  {c_out, out} = A + 1'b1;
            3'd3 :  {c_out, out} = B + 1'b1;
            3'd4 :  {c_out, out} = A - 1'b1;
            3'd5 :  {c_out, out} = B - 1'b1;
            3'd6 :  begin out = A; c_out = 0; end
            3'd7 :  begin out = B; c_out = 0; end
            default: out  = 8'd0;
       endcase
    end
    else
    begin
		 c_out = 0;   			//Keeping C out LOW in Logical Mode
       case(control_line)
            3'd0 :  out = A & B;
            3'd1 :  out = A | B; 
            3'd2 :  out = A ^ B;
				3'd3 :  out = ~ (A | B);
            3'd4 :  out = A << 2;
            3'd5 :  out = B << 2;
            3'd6 :  out = A >> 2;
            3'd7 :  out = B >> 2;
            default: out  = 8'd0;       
       endcase
    end
end

endmodule
