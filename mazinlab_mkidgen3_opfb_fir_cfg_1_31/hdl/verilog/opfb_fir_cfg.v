// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="opfb_fir_cfg_opfb_fir_cfg,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.214000,HLS_SYN_LAT=259,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=30,HLS_SYN_LUT=119,HLS_VERSION=2021_1}" *)

module opfb_fir_cfg (
// synthesis translate_off
    kernel_block,
// synthesis translate_on
        ap_clk,
        ap_rst_n,
        config_r_TDATA,
        config_r_TVALID,
        config_r_TREADY,
        config_r_TKEEP,
        config_r_TSTRB,
        config_r_TLAST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

// synthesis translate_off
output kernel_block;
// synthesis translate_on
input   ap_clk;
input   ap_rst_n;
output  [7:0] config_r_TDATA;
output   config_r_TVALID;
input   config_r_TREADY;
output  [0:0] config_r_TKEEP;
output  [0:0] config_r_TSTRB;
output  [0:0] config_r_TLAST;

 reg    ap_rst_n_inv;
reg   [0:0] run;
wire    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start;
wire    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done;
wire    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_idle;
wire    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_ready;
wire    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TREADY;
wire   [7:0] grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TDATA;
wire    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID;
wire   [0:0] grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TKEEP;
wire   [0:0] grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TSTRB;
wire   [0:0] grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TLAST;
reg    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] run_load_load_fu_50_p1;
wire    ap_CS_fsm_state2;
reg   [2:0] ap_NS_fsm;
wire    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    regslice_both_config_V_data_V_U_apdone_blk;
wire    ap_CS_fsm_state3;
wire    config_r_TVALID_int_regslice;
wire    config_r_TREADY_int_regslice;
wire    regslice_both_config_V_data_V_U_vld_out;
wire    regslice_both_config_V_keep_V_U_apdone_blk;
wire    regslice_both_config_V_keep_V_U_ack_in_dummy;
wire    regslice_both_config_V_keep_V_U_vld_out;
wire    regslice_both_config_V_strb_V_U_apdone_blk;
wire    regslice_both_config_V_strb_V_U_ack_in_dummy;
wire    regslice_both_config_V_strb_V_U_vld_out;
wire    regslice_both_config_V_last_V_U_apdone_blk;
wire    regslice_both_config_V_last_V_U_ack_in_dummy;
wire    regslice_both_config_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 run = 1'd1;
#0 grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
end

opfb_fir_cfg_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1 grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start),
    .ap_done(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done),
    .ap_idle(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_idle),
    .ap_ready(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_ready),
    .config_r_TREADY(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TREADY),
    .config_r_TDATA(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TDATA),
    .config_r_TVALID(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID),
    .config_r_TKEEP(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TKEEP),
    .config_r_TSTRB(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TSTRB),
    .config_r_TLAST(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TLAST)
);

opfb_fir_cfg_regslice_both #(
    .DataWidth( 8 ))
regslice_both_config_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TDATA),
    .vld_in(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID),
    .ack_in(config_r_TREADY_int_regslice),
    .data_out(config_r_TDATA),
    .vld_out(regslice_both_config_V_data_V_U_vld_out),
    .ack_out(config_r_TREADY),
    .apdone_blk(regslice_both_config_V_data_V_U_apdone_blk)
);

opfb_fir_cfg_regslice_both #(
    .DataWidth( 1 ))
regslice_both_config_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TKEEP),
    .vld_in(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID),
    .ack_in(regslice_both_config_V_keep_V_U_ack_in_dummy),
    .data_out(config_r_TKEEP),
    .vld_out(regslice_both_config_V_keep_V_U_vld_out),
    .ack_out(config_r_TREADY),
    .apdone_blk(regslice_both_config_V_keep_V_U_apdone_blk)
);

opfb_fir_cfg_regslice_both #(
    .DataWidth( 1 ))
regslice_both_config_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TSTRB),
    .vld_in(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID),
    .ack_in(regslice_both_config_V_strb_V_U_ack_in_dummy),
    .data_out(config_r_TSTRB),
    .vld_out(regslice_both_config_V_strb_V_U_vld_out),
    .ack_out(config_r_TREADY),
    .apdone_blk(regslice_both_config_V_strb_V_U_apdone_blk)
);

opfb_fir_cfg_regslice_both #(
    .DataWidth( 1 ))
regslice_both_config_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TLAST),
    .vld_in(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID),
    .ack_in(regslice_both_config_V_last_V_U_ack_in_dummy),
    .data_out(config_r_TLAST),
    .vld_out(regslice_both_config_V_last_V_U_vld_out),
    .ack_out(config_r_TREADY),
    .apdone_blk(regslice_both_config_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg <= 1'b0;
    end else begin
        if (((run_load_load_fu_50_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg <= 1'b1;
        end else if ((grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_ready == 1'b1)) begin
            grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        run <= 1'd0;
    end
end

assign ap_ST_fsm_state1_blk = 1'b0;

always @ (*) begin
    if ((grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((regslice_both_config_V_data_V_U_apdone_blk == 1'b1)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((run_load_load_fu_50_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((regslice_both_config_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
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
    ap_rst_n_inv = ~ap_rst_n;
end

assign config_r_TVALID = regslice_both_config_V_data_V_U_vld_out;

assign config_r_TVALID_int_regslice = grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID;

assign grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start = grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg;

assign grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TREADY = (config_r_TREADY_int_regslice & ap_CS_fsm_state2);

assign run_load_load_fu_50_p1 = run;


// synthesis translate_off
`include "opfb_fir_cfg_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //opfb_fir_cfg

