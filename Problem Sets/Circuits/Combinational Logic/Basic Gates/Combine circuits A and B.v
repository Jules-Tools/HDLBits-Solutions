module top_module (input x, input y, output z);
    wire im1, im2, im3, im4;
    modA IA1(.x(x), .y(y), .z(im1));
    modB IB1(.x(x), .y(y), .z(im2));
    modA IA2(.x(x), .y(y), .z(im3));
    modB IB2(.x(x), .y(y), .z(im4));
    assign z = (im1 | im2) ^ (im3 & im4);
endmodule

module modA (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule

module modB ( input x, input y, output z );
    assign z =  !(x ^ y);
endmodule