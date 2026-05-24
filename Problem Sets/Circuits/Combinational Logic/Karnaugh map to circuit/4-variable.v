module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~b & ~c) | (~a & ~d) | (a & ~b & d) | (~a & b & c) | (b & c & d);
endmodule