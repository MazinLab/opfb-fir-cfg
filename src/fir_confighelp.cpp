typedef struct {
	char data;
	bool last;
} axisconfig_t;

void top(axisconfig_t config[512]){
#pragma HLS INTERFACE axis register reverse port=config
	static bool run=true;
	if(run){
		for(int i=0; i<512; i++){
			config[i].data=i/2;
			config[i].last = i==511;
		}
		run=false;
	}
}
