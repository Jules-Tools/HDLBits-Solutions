module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (a != c & b == d) | (b != d & a == c);
endmodule