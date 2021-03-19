#include "fir_config.hpp"


void opfb_fir_cfg(hls::stream<cfg_t> &config){
#pragma HLS INTERFACE axis register port=config depth=1024
#pragma HLS INTERFACE ap_ctrl_none port=return

	static bool run=true;
	if(run){
		for(ap_uint<10> i=0; i<N_CHAN; i++){
#pragma PIPELINE II=1
		cfg_t tmp;
		tmp.data=i/2;
		tmp.last = i==N_CHAN-1;
		config.write(tmp);
	}
		run=false;
	}
}
