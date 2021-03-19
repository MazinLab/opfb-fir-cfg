#include<iostream>
#include "fir_config.hpp"
using namespace std;

int main(){

	bool fail=false;

	hls::stream<cfg_t> output;

	opfb_fir_cfg(output);

	cfg_t out;
	for (int i=0;i<N_CHAN;i++) {
		unsigned int expected=i/2;
		out=output.read();
		if (out.data.to_uint()!=expected) {
			fail=true;
			cout<<"FAIL: Channel order wrong"<<out.data.to_uint()<<" is not "<<i<<"\n";
		}

		if (i!=N_CHAN-1 && out.last) {
			cout<<"FAIL: TLAST asserted early\n";
			fail=true;
		}

	}

	fail|=!out.last;  //Must assert TLAS on last channel

	if (!fail) cout<<"PASS!\n";
	return fail;
}
