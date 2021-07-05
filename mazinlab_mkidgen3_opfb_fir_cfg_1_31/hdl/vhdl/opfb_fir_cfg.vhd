-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity opfb_fir_cfg is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    config_r_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    config_r_TVALID : OUT STD_LOGIC;
    config_r_TREADY : IN STD_LOGIC;
    config_r_TKEEP : OUT STD_LOGIC_VECTOR (0 downto 0);
    config_r_TSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
    config_r_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of opfb_fir_cfg is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "opfb_fir_cfg_opfb_fir_cfg,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.214000,HLS_SYN_LAT=259,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=30,HLS_SYN_LUT=119,HLS_VERSION=2021_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

    signal ap_rst_n_inv : STD_LOGIC;
    signal run : STD_LOGIC_VECTOR (0 downto 0) := "1";
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start : STD_LOGIC;
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done : STD_LOGIC;
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_idle : STD_LOGIC;
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_ready : STD_LOGIC;
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TREADY : STD_LOGIC;
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TDATA : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID : STD_LOGIC;
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TKEEP : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TSTRB : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal run_load_load_fu_50_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal regslice_both_config_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal config_r_TVALID_int_regslice : STD_LOGIC;
    signal config_r_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_config_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_config_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_config_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_config_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_config_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_config_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_config_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_config_V_last_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_config_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_config_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component opfb_fir_cfg_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        config_r_TREADY : IN STD_LOGIC;
        config_r_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
        config_r_TVALID : OUT STD_LOGIC;
        config_r_TKEEP : OUT STD_LOGIC_VECTOR (0 downto 0);
        config_r_TSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
        config_r_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component opfb_fir_cfg_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38 : component opfb_fir_cfg_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start,
        ap_done => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done,
        ap_idle => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_idle,
        ap_ready => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_ready,
        config_r_TREADY => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TREADY,
        config_r_TDATA => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TDATA,
        config_r_TVALID => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID,
        config_r_TKEEP => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TKEEP,
        config_r_TSTRB => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TSTRB,
        config_r_TLAST => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TLAST);

    regslice_both_config_V_data_V_U : component opfb_fir_cfg_regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TDATA,
        vld_in => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID,
        ack_in => config_r_TREADY_int_regslice,
        data_out => config_r_TDATA,
        vld_out => regslice_both_config_V_data_V_U_vld_out,
        ack_out => config_r_TREADY,
        apdone_blk => regslice_both_config_V_data_V_U_apdone_blk);

    regslice_both_config_V_keep_V_U : component opfb_fir_cfg_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TKEEP,
        vld_in => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID,
        ack_in => regslice_both_config_V_keep_V_U_ack_in_dummy,
        data_out => config_r_TKEEP,
        vld_out => regslice_both_config_V_keep_V_U_vld_out,
        ack_out => config_r_TREADY,
        apdone_blk => regslice_both_config_V_keep_V_U_apdone_blk);

    regslice_both_config_V_strb_V_U : component opfb_fir_cfg_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TSTRB,
        vld_in => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID,
        ack_in => regslice_both_config_V_strb_V_U_ack_in_dummy,
        data_out => config_r_TSTRB,
        vld_out => regslice_both_config_V_strb_V_U_vld_out,
        ack_out => config_r_TREADY,
        apdone_blk => regslice_both_config_V_strb_V_U_apdone_blk);

    regslice_both_config_V_last_V_U : component opfb_fir_cfg_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TLAST,
        vld_in => grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID,
        ack_in => regslice_both_config_V_last_V_U_ack_in_dummy,
        data_out => config_r_TLAST,
        vld_out => regslice_both_config_V_last_V_U_vld_out,
        ack_out => config_r_TREADY,
        apdone_blk => regslice_both_config_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg <= ap_const_logic_0;
            else
                if (((run_load_load_fu_50_p1 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_ready = ap_const_logic_1)) then 
                    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                run <= ap_const_lv1_0;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done, ap_CS_fsm, ap_CS_fsm_state1, run_load_load_fu_50_p1, ap_CS_fsm_state2, regslice_both_config_V_data_V_U_apdone_blk, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((run_load_load_fu_50_p1 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((regslice_both_config_V_data_V_U_apdone_blk = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_ST_fsm_state1_blk <= ap_const_logic_0;

    ap_ST_fsm_state2_blk_assign_proc : process(grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done)
    begin
        if ((grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state3_blk_assign_proc : process(regslice_both_config_V_data_V_U_apdone_blk)
    begin
        if ((regslice_both_config_V_data_V_U_apdone_blk = ap_const_logic_1)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    config_r_TVALID <= regslice_both_config_V_data_V_U_vld_out;
    config_r_TVALID_int_regslice <= grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TVALID;
    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start <= grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_ap_start_reg;
    grp_opfb_fir_cfg_Pipeline_VITIS_LOOP_10_1_fu_38_config_r_TREADY <= (config_r_TREADY_int_regslice and ap_CS_fsm_state2);
    run_load_load_fu_50_p1 <= run;
end behav;
