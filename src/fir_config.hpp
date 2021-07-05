#include "ap_axi_sdata.h"
#include "hls_stream.h"
#define N_CHAN 512
typedef ap_axiu<8,0,0,0> cfg_t;

void opfb_fir_cfg(hls::stream<cfg_t> &config);
