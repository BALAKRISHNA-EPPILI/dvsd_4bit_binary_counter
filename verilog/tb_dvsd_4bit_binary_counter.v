#! /usr/bin/vvp
:ivl_version "10.3 (stable)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x55fd81ae8170 .scope module, "dvsd_4bit_binary_counter" "dvsd_4bit_binary_counter" 2 9;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk"
    .port_info 1 /INPUT 1 "reset"
    .port_info 2 /INPUT 1 "updown"
    .port_info 3 /OUTPUT 4 "out"
o0x7fb896b62018 .functor BUFZ 1, C4<z>; HiZ drive
v0x55fd81ae83a0_0 .net "clk", 0 0, o0x7fb896b62018;  0 drivers
v0x55fd81b2c140_0 .var "out", 3 0;
o0x7fb896b62078 .functor BUFZ 1, C4<z>; HiZ drive
v0x55fd81b2c220_0 .net "reset", 0 0, o0x7fb896b62078;  0 drivers
o0x7fb896b620a8 .functor BUFZ 1, C4<z>; HiZ drive
v0x55fd81b2c2f0_0 .net "updown", 0 0, o0x7fb896b620a8;  0 drivers
E_0x55fd81b1d720 .event posedge, v0x55fd81ae83a0_0;
    .scope S_0x55fd81ae8170;
T_0 ;
    %wait E_0x55fd81b1d720;
    %load/vec4 v0x55fd81b2c220_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.0, 8;
    %pushi/vec4 0, 0, 4;
    %assign/vec4 v0x55fd81b2c140_0, 0;
    %jmp T_0.1;
T_0.0 ;
    %load/vec4 v0x55fd81b2c2f0_0;
    %pad/u 32;
    %cmpi/e 1, 0, 32;
    %jmp/0xz  T_0.2, 4;
    %load/vec4 v0x55fd81b2c140_0;
    %pad/u 32;
    %cmpi/e 15, 0, 32;
    %jmp/0xz  T_0.4, 4;
    %pushi/vec4 0, 0, 4;
    %assign/vec4 v0x55fd81b2c140_0, 0;
    %jmp T_0.5;
T_0.4 ;
    %load/vec4 v0x55fd81b2c140_0;
    %addi 1, 0, 4;
    %assign/vec4 v0x55fd81b2c140_0, 0;
T_0.5 ;
    %jmp T_0.3;
T_0.2 ;
    %load/vec4 v0x55fd81b2c140_0;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_0.6, 4;
    %pushi/vec4 15, 0, 4;
    %assign/vec4 v0x55fd81b2c140_0, 0;
    %jmp T_0.7;
T_0.6 ;
    %load/vec4 v0x55fd81b2c140_0;
    %subi 1, 0, 4;
    %assign/vec4 v0x55fd81b2c140_0, 0;
T_0.7 ;
T_0.3 ;
T_0.1 ;
    %jmp T_0;
    .thread T_0;
# The file index is used to find the file name in the following table.
:file_names 3;
    "N/A";
    "<interactive>";
    "dvsd_4bit_binary_counter.v";
