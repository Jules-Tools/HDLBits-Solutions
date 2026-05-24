module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = ((a & !c & d) | (!a & b & !c & !d)) ? d: (((a&c) | (!a & !b & c) | (a & !c & !d))? 1 : 0);
endmodule