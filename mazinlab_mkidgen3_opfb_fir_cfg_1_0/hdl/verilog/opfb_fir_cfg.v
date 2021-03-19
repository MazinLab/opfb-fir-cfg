// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="opfb_fir_cfg_opfb_fir_cfg,hls_ip_2020_1_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.199250,HLS_SYN_LAT=258,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=29,HLS_SYN_LUT=110,HLS_VERSION=2020_1_1}" *)

module opfb_fir_cfg (
        ap_clk,
        ap_rst_n,
        config_r_TDATA,
        config_r_TVALID,
        config_r_TREADY,
        config_r_TLAST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state5 = 3'd4;

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
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln10_reg_121;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] icmp_ln10_reg_121_pp0_iter1_reg;
reg   [9:0] t_V_reg_68;
wire   [0:0] run_load_load_fu_79_p1;
reg   [0:0] run_load_reg_117;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln10_fu_83_p2;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
wire    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_11001;
wire   [9:0] i_V_fu_89_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [7:0] tmp_data_V_reg_130;
wire   [0:0] tmp_last_V_fu_105_p2;
reg   [0:0] tmp_last_V_reg_135;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
wire    ap_CS_fsm_state5;
wire    regslice_both_config_V_data_V_U_apdone_blk;
wire    ap_block_pp0_stage0_01001;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    config_r_TVALID_int_regslice;
wire    config_r_TREADY_int_regslice;
wire    regslice_both_config_V_data_V_U_vld_out;
wire    regslice_both_config_V_last_V_U_apdone_blk;
wire    regslice_both_config_V_last_V_U_ack_in_dummy;
wire    regslice_both_config_V_last_V_U_vld_out;

// power-on initialization
initial begin
#0 run = 1'd1;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

regslice_both #(
    .DataWidth( 8 ))
regslice_both_config_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(tmp_data_V_reg_130),
    .vld_in(config_r_TVALID_int_regslice),
    .ack_in(config_r_TREADY_int_regslice),
    .data_out(config_r_TDATA),
    .vld_out(regslice_both_config_V_data_V_U_vld_out),
    .ack_out(config_r_TREADY),
    .apdone_blk(regslice_both_config_V_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_config_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(tmp_last_V_reg_135),
    .vld_in(config_r_TVALID_int_regslice),
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
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((run_load_load_fu_79_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if (((run_load_load_fu_79_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((run_load_load_fu_79_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        t_V_reg_68 <= 10'd0;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln10_fu_83_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        t_V_reg_68 <= i_V_fu_89_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln10_reg_121 <= icmp_ln10_fu_83_p2;
        icmp_ln10_reg_121_pp0_iter1_reg <= icmp_ln10_reg_121;
    end
end

always @ (posedge ap_clk) begin
    if (((run_load_reg_117 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (regslice_both_config_V_data_V_U_apdone_blk == 1'b0))) begin
        run <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        run_load_reg_117 <= run;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln10_fu_83_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_data_V_reg_130 <= {{t_V_reg_68[8:1]}};
        tmp_last_V_reg_135 <= tmp_last_V_fu_105_p2;
    end
end

always @ (*) begin
    if ((icmp_ln10_fu_83_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln10_reg_121_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((icmp_ln10_reg_121 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        config_r_TDATA_blk_n = config_r_TREADY_int_regslice;
    end else begin
        config_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln10_reg_121 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        config_r_TVALID_int_regslice = 1'b1;
    end else begin
        config_r_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((run_load_load_fu_79_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln10_fu_83_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln10_fu_83_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (regslice_both_config_V_data_V_U_apdone_blk == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state4_io)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state4_io)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io)));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = ((icmp_ln10_reg_121 == 1'd0) & (config_r_TREADY_int_regslice == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_io = ((icmp_ln10_reg_121_pp0_iter1_reg == 1'd0) & (config_r_TREADY_int_regslice == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign config_r_TVALID = regslice_both_config_V_data_V_U_vld_out;

assign i_V_fu_89_p2 = (t_V_reg_68 + 10'd1);

assign icmp_ln10_fu_83_p2 = ((t_V_reg_68 == 10'd512) ? 1'b1 : 1'b0);

assign run_load_load_fu_79_p1 = run;

assign tmp_last_V_fu_105_p2 = ((t_V_reg_68 == 10'd511) ? 1'b1 : 1'b0);

endmodule //opfb_fir_cfg
