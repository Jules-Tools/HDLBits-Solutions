module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    reg coutR[2:0];
    bcd_fadd bfa3 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(coutR[0]), .sum(sum[3:0]));
    bcd_fadd bfa2 (.a(a[7:4]), .b(b[7:4]), .cin(coutR[0]), .cout(coutR[1]), .sum(sum[7:4]));
    bcd_fadd bfa1 (.a(a[11:8]), .b(b[11:8]), .cin(coutR[1]), .cout(coutR[2]), .sum(sum[11:8]));
    bcd_fadd bfa0 (.a(a[15:12]), .b(b[15:12]), .cin(coutR[2]), .cout(cout), .sum(sum[15:12]));
endmodule