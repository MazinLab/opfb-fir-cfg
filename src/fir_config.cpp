#include "fir_config.hpp"

void opfb_fir_cfg(axisconfig_t config[512]){
#pragma HLS INTERFACE axis register reverse port=config
//	static bool run=true;
	//if(run){
		for(unsigned int i=0; i<N_CHAN; i++){
//#pragma HLS PIPELINE
			config[i].data=i/2;
			config[i].last = i==N_CHAN-1;
		}
///	run=false;
//	}
}
