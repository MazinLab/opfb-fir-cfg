#include<iostream>
#include "fir_config.hpp"
using namespace std;

int main(){

	bool fail=false;

	axisconfig_t output[N_CHAN];

	opfb_fir_cfg(output);

	for (int i=0;i<N_CHAN;i++) {
		unsigned int expected=i/2;
		if (output[i].data.to_uint()!=expected) {
			fail=true;
			cout<<"FAIL: Channel order wrong"<<output[i].data.to_uint()<<" is not "<<i<<"\n";
		}

		if (i!=N_CHAN-1 && output[i].last) {
			cout<<"FAIL: TLAST asserted early\n";
			fail=true;
		}

	}

	fail|=!output[N_CHAN-1].last;  //Must assert TLAS on last channel

	if (!fail) cout<<"PASS!\n";
	return fail;
}
