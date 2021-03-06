/* Generated by Yosys 0.9+4052 (git sha1 d061b0e, gcc 8.3.1 -fPIC -Os) */

module dvsd_4bit_binary_counter(clk, reset, updown, out);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  input clk;
  output [3:0] out;
  input reset;
  input updown;
  sky130_fd_sc_hd__nor2b_2 _23_ (
    .A(reset),
    .B_N(_10_),
    .Y(_14_)
  );
  sky130_fd_sc_hd__nor2b_2 _24_ (
    .A(reset),
    .B_N(_09_),
    .Y(_13_)
  );
  sky130_fd_sc_hd__nor2b_2 _25_ (
    .A(reset),
    .B_N(_08_),
    .Y(_12_)
  );
  sky130_fd_sc_hd__inv_2 _26_ (
    .A(out[0]),
    .Y(_00_)
  );
  sky130_fd_sc_hd__buf_1 _27_ (
    .A(_00_),
    .X(_01_)
  );
  sky130_fd_sc_hd__or2_2 _28_ (
    .A(out[0]),
    .B(out[1]),
    .X(_16_)
  );
  sky130_fd_sc_hd__nand2_2 _29_ (
    .A(out[0]),
    .B(out[1]),
    .Y(_17_)
  );
  sky130_fd_sc_hd__nand2_2 _30_ (
    .A(_16_),
    .B(_17_),
    .Y(_02_)
  );
  sky130_fd_sc_hd__inv_2 _31_ (
    .A(_02_),
    .Y(_03_)
  );
  sky130_fd_sc_hd__or2_2 _32_ (
    .A(out[2]),
    .B(_16_),
    .X(_18_)
  );
  sky130_fd_sc_hd__a21bo_2 _33_ (
    .A1(out[2]),
    .A2(_16_),
    .B1_N(_18_),
    .X(_04_)
  );
  sky130_fd_sc_hd__inv_2 _34_ (
    .A(out[2]),
    .Y(_19_)
  );
  sky130_fd_sc_hd__inv_2 _35_ (
    .A(_17_),
    .Y(_20_)
  );
  sky130_fd_sc_hd__o22a_2 _36_ (
    .A1(_19_),
    .A2(_17_),
    .B1(out[2]),
    .B2(_20_),
    .X(_05_)
  );
  sky130_fd_sc_hd__inv_2 _37_ (
    .A(out[3]),
    .Y(_21_)
  );
  sky130_fd_sc_hd__o2bb2a_2 _38_ (
    .A1_N(_21_),
    .A2_N(_18_),
    .B1(_21_),
    .B2(_18_),
    .X(_06_)
  );
  sky130_fd_sc_hd__o21a_2 _39_ (
    .A1(_19_),
    .A2(_17_),
    .B1(out[3]),
    .X(_22_)
  );
  sky130_fd_sc_hd__a31o_2 _40_ (
    .A1(out[2]),
    .A2(_20_),
    .A3(_21_),
    .B1(_22_),
    .X(_07_)
  );
  sky130_fd_sc_hd__nor2b_2 _41_ (
    .A(reset),
    .B_N(_11_),
    .Y(_15_)
  );
  sky130_fd_sc_hd__mux2_1 _42_ (
    .A0(_00_),
    .A1(_01_),
    .S(updown),
    .X(_08_)
  );
  sky130_fd_sc_hd__mux2_1 _43_ (
    .A0(_02_),
    .A1(_03_),
    .S(updown),
    .X(_09_)
  );
  sky130_fd_sc_hd__mux2_1 _44_ (
    .A0(_04_),
    .A1(_05_),
    .S(updown),
    .X(_10_)
  );
  sky130_fd_sc_hd__mux2_1 _45_ (
    .A0(_06_),
    .A1(_07_),
    .S(updown),
    .X(_11_)
  );
  sky130_fd_sc_hd__dfxtp_2 _46_ (
    .CLK(clk),
    .D(_12_),
    .Q(out[0])
  );
  sky130_fd_sc_hd__dfxtp_2 _47_ (
    .CLK(clk),
    .D(_13_),
    .Q(out[1])
  );
  sky130_fd_sc_hd__dfxtp_2 _48_ (
    .CLK(clk),
    .D(_14_),
    .Q(out[2])
  );
  sky130_fd_sc_hd__dfxtp_2 _49_ (
    .CLK(clk),
    .D(_15_),
    .Q(out[3])
  );
endmodule
