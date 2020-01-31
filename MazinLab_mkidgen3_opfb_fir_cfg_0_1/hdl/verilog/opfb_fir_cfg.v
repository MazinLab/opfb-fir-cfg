// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="opfb_fir_cfg,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.912250,HLS_SYN_LAT=513,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=25,HLS_SYN_LUT=86,HLS_VERSION=2019_2_1}" *)

module opfb_fir_cfg (
        ap_clk,
        ap_rst_n,
        config_r_TDATA,
        config_r_TVALID,
        config_r_TREADY,
        config_r_TLAST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst_n;
output  [7:0] config_r_TDATA;
output   config_r_TVALID;
input   config_r_TREADY;
output  [0:0] config_r_TLAST;

 reg    ap_rst_n_inv;
reg   [0:0] run;
reg    config_r_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state2;
reg   [0:0] run_load_reg_107;
wire   [0:0] icmp_ln9_fu_71_p2;
wire    ap_CS_fsm_state3;
wire   [0:0] run_load_load_fu_67_p1;
wire    ap_CS_fsm_state1;
wire   [9:0] i_fu_77_p2;
reg   [9:0] i_reg_114;
wire    regslice_reverse_config_data_V_U_apdone_blk;
reg    ap_predicate_op19_write_state2;
reg    ap_block_state2_io;
reg   [9:0] i_0_reg_56;
reg   [2:0] ap_NS_fsm;
wire   [7:0] config_r_TDATA_int;
reg    config_r_TVALID_int;
wire    config_r_TREADY_int;
wire    regslice_reverse_config_data_V_U_vld_out;
wire    regslice_reverse_config_last_V_U_apdone_blk;
wire   [0:0] config_r_TLAST_int;
wire    regslice_reverse_config_last_V_U_ack_in_dummy;
wire    regslice_reverse_config_last_V_U_vld_out;

// power-on initialization
initial begin
#0 run = 1'd1;
#0 ap_CS_fsm = 3'd1;
end

regslice_reverse #(
    .DataWidth( 8 ))
regslice_reverse_config_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(config_r_TDATA_int),
    .vld_in(config_r_TVALID_int),
    .ack_in(config_r_TREADY_int),
    .data_out(config_r_TDATA),
    .vld_out(regslice_reverse_config_data_V_U_vld_out),
    .ack_out(config_r_TREADY),
    .apdone_blk(regslice_reverse_config_data_V_U_apdone_blk)
);

regslice_reverse #(
    .DataWidth( 1 ))
regslice_reverse_config_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(config_r_TLAST_int),
    .vld_in(config_r_TVALID_int),
    .ack_in(regslice_reverse_config_last_V_U_ack_in_dummy),
    .data_out(config_r_TLAST),
    .vld_out(regslice_reverse_config_last_V_U_vld_out),
    .ack_out(config_r_TREADY),
    .apdone_blk(regslice_reverse_config_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (run_load_load_fu_67_p1 == 1'd1))) begin
        i_0_reg_56 <= 10'd0;
    end else if (((1'b1 == ap_CS_fsm_state3) & (config_r_TREADY_int == 1'b1))) begin
        i_0_reg_56 <= i_reg_114;
    end
end

always @ (posedge ap_clk) begin
    if ((~((regslice_reverse_config_data_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state2_io)) & (1'b1 == ap_CS_fsm_state2) & (run_load_reg_107 == 1'd1))) begin
        i_reg_114 <= i_fu_77_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((regslice_reverse_config_data_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state2_io)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln9_fu_71_p2 == 1'd1) & (run_load_reg_107 == 1'd1))) begin
        run <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        run_load_reg_107 <= run;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((icmp_ln9_fu_71_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (run_load_reg_107 == 1'd1)))) begin
        config_r_TDATA_blk_n = config_r_TREADY_int;
    end else begin
        config_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((regslice_reverse_config_data_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state2_io)) & (1'b1 == ap_CS_fsm_state2) & (ap_predicate_op19_write_state2 == 1'b1))) begin
        config_r_TVALID_int = 1'b1;
    end else begin
        config_r_TVALID_int = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state2 : begin
            if ((~((regslice_reverse_config_data_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state2_io)) & (1'b1 == ap_CS_fsm_state2) & ((run_load_reg_107 == 1'd0) | (icmp_ln9_fu_71_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((regslice_reverse_config_data_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state2_io)) & (icmp_ln9_fu_71_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (run_load_reg_107 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (config_r_TREADY_int == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state2_io = ((config_r_TREADY_int == 1'b0) & (ap_predicate_op19_write_state2 == 1'b1));
end

always @ (*) begin
    ap_predicate_op19_write_state2 = ((icmp_ln9_fu_71_p2 == 1'd0) & (run_load_reg_107 == 1'd1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign config_r_TDATA_int = {{i_0_reg_56[8:1]}};

assign config_r_TLAST_int = ((i_0_reg_56 == 10'd511) ? 1'b1 : 1'b0);

assign config_r_TVALID = regslice_reverse_config_data_V_U_vld_out;

assign i_fu_77_p2 = (i_0_reg_56 + 10'd1);

assign icmp_ln9_fu_71_p2 = ((i_0_reg_56 == 10'd512) ? 1'b1 : 1'b0);

assign run_load_load_fu_67_p1 = run;

endmodule //opfb_fir_cfg
