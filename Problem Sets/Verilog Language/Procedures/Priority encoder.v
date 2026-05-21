// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
        if (in & 4'b0001) 
            pos = 2'b00;
        else if (in & 4'b0010)
            pos = 2'b01;
        else if (in & 4'b0100)
            pos = 2'b10;
        else if (in & 4'b1000)
            pos = 2'b11;
        else
            pos = 0;
    end
endmodule