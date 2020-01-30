#include "ap_int.h"

typedef struct {
	ap_uint<8> data;
	ap_uint<1> last;
} axisconfig_t;

#define N_CHAN 512

void opfb_fir_cfg(axisconfig_t config[N_CHAN]);
