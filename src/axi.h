#ifndef __axi_h__
#define __axi_h__


#include <hls_stream.h>
#include "ap_axi_sdata.h"


template<int D>
  struct ap_axiu <D, 0, 0, 0>{
    ap_uint<D>       data;
    ap_uint<1>       last;
 };

template<int D, int U>
  struct ap_axiu <D, U, 0, 0>{
    ap_uint<D>       data;
    ap_uint<U>       user;
    ap_uint<1>       last;
 };




#ifdef AESL_SYN
#if ((__clang_major__ != 3) || (__clang_minor__ != 1))
#include "hls_stream.h"
namespace hls {

// Specialization
template <int D>
class stream<ap_axiu<D, 0, 0, 0> > {
  typedef ap_axiu<D, 0, 0, 0> __STREAM_T__ ;
public:
  /// Constructors
  INLINE stream() {}

  INLINE stream(const char* name) { (void)name; }

  /// Make copy constructor and assignment operator private
private:
  INLINE stream(const stream< __STREAM_T__ >& chn):V(chn.V) {}

  INLINE stream& operator= (const stream< __STREAM_T__ >& chn) {
    V = chn.V;
    return *this;
  }

public:
  /// Overload >> and << operators to implement read() and write()
  INLINE void operator >> (__STREAM_T__& rdata) {
    read(rdata);
  }

  INLINE void operator << (const __STREAM_T__& wdata) {
    write(wdata);
  }

  /// Empty & Full
  bool empty() const {
    #pragma HLS inline
    bool tmp = __fpga_axis_valid(&V.data, ((int*)0), ((int*)0),
                                 ((int*)0), &V.last, ((int*)0), ((int*)0));
    return !tmp;
  }

  bool full() const {
    #pragma HLS inline
    bool tmp = __fpga_axis_ready(&V.data, ((int*)0), ((int*)0),
                                 ((int*)0), &V.last, ((int*)0), ((int*)0));
    return !tmp;
  }

  /// Blocking read
  void read(__STREAM_T__ &dout) {
    #pragma HLS inline
    __fpga_axis_pop(&V.data, ((int*)0), ((int*)0),
                    ((int*)0), &V.last, ((int*)0), ((int*)0),
                    &dout.data, ((int*)0), ((int*)0),
                    ((int*)0), &dout.last, ((int*)0), ((int*)0));
  }

  __STREAM_T__ read() {
    #pragma HLS inline
    __STREAM_T__ tmp;
    __fpga_axis_pop(&V.data, ((int*)0), ((int*)0),
                    ((int*)0), &V.last, ((int*)0), ((int*)0),
                    &tmp.data, ((int*)0), ((int*)0),
                    ((int*)0), &tmp.last, ((int*)0), ((int*)0));
    return tmp;
  }

  /// Nonblocking read
  bool read_nb(__STREAM_T__ &dout) {
    #pragma HLS inline
    bool empty_n =
    __fpga_axis_nb_pop(&V.data, ((int*)0), ((int*)0),
                       ((int*)0), &V.last, ((int*)0), ((int*)0),
                       &dout.data, ((int*)0), ((int*)0),
                       ((int*)0), &dout.last, ((int*)0), ((int*)0));
    return empty_n;
  }

  // Blocking write
  void write(const __STREAM_T__ &din) {
    #pragma HLS inline
    __STREAM_T__ tmp = din;
    __fpga_axis_push(&V.data, ((int*)0), ((int*)0),
                     ((int*)0), &V.last, ((int*)0), ((int*)0),
                     &tmp.data, ((int*)0), ((int*)0),
                     ((int*)0), &tmp.last, ((int*)0), ((int*)0));
  }

  /// Nonblocking write
  bool write_nb(const __STREAM_T__ &din) {
    #pragma HLS inline
    __STREAM_T__ tmp = din;
    bool full_n =
    __fpga_axis_nb_push(&V.data, ((int*)0), ((int*)0),
                        ((int*)0), &V.last, ((int*)0), ((int*)0),
                        &tmp.data, ((int*)0), ((int*)0),
                        ((int*)0), &tmp.last, ((int*)0), ((int*)0));
    return full_n;
  }

  /// Fifo size
  //inline unsigned size() {
  //  unsigned size = __fpga_axis_size(&V);
  //  return size;
  //}

  __STREAM_T__ V;
};


// Specialization
template <int D, int U>
class stream<ap_axiu<D, U, 0, 0> > {
  typedef ap_axiu<D, U, 0, 0> __STREAM_T__ ;
public:
  /// Constructors
  INLINE stream() {}

  INLINE stream(const char* name) { (void)name; }

  /// Make copy constructor and assignment operator private
private:
  INLINE stream(const stream< __STREAM_T__ >& chn):V(chn.V) {}

  INLINE stream& operator= (const stream< __STREAM_T__ >& chn) {
    V = chn.V;
    return *this;
  }

public:
  /// Overload >> and << operators to implement read() and write()
  INLINE void operator >> (__STREAM_T__& rdata) {
    read(rdata);
  }

  INLINE void operator << (const __STREAM_T__& wdata) {
    write(wdata);
  }

  /// Empty & Full
  bool empty() const {
    #pragma HLS inline
    bool tmp = __fpga_axis_valid(&V.data, ((int*)0), ((int*)0),
    							 &V.user, &V.last, ((int*)0), ((int*)0));
    return !tmp;
  }

  bool full() const {
    #pragma HLS inline
    bool tmp = __fpga_axis_ready(&V.data, ((int*)0), ((int*)0),
    							 &V.user, &V.last, ((int*)0), ((int*)0));
    return !tmp;
  }

  /// Blocking read
  void read(__STREAM_T__ &dout) {
    #pragma HLS inline
    __fpga_axis_pop(&V.data, ((int*)0), ((int*)0),
    				&V.user, &V.last, ((int*)0), ((int*)0),
                    &dout.data, ((int*)0), ((int*)0),
					&dout.user, &dout.last, ((int*)0), ((int*)0));
  }

  __STREAM_T__ read() {
    #pragma HLS inline
    __STREAM_T__ tmp;
    __fpga_axis_pop(&V.data, ((int*)0), ((int*)0),
                    &V.user, &V.last, ((int*)0), ((int*)0),
                    &tmp.data, ((int*)0), ((int*)0),
                    &tmp.user, &tmp.last, ((int*)0), ((int*)0));
    return tmp;
  }

  /// Nonblocking read
  bool read_nb(__STREAM_T__ &dout) {
    #pragma HLS inline
    bool empty_n =
    __fpga_axis_nb_pop(&V.data, ((int*)0), ((int*)0),
                       &V.user, &V.last, ((int*)0), ((int*)0),
                       &dout.data, ((int*)0), ((int*)0),
					   &dout.user, &dout.last, ((int*)0), ((int*)0));
    return empty_n;
  }

  // Blocking write
  void write(const __STREAM_T__ &din) {
    #pragma HLS inline
    __STREAM_T__ tmp = din;
    __fpga_axis_push(&V.data, ((int*)0), ((int*)0),
                     &V.user, &V.last, ((int*)0), ((int*)0),
                     &tmp.data, ((int*)0), ((int*)0),
                     &tmp.user, &tmp.last, ((int*)0), ((int*)0));
  }

  /// Nonblocking write
  bool write_nb(const __STREAM_T__ &din) {
    #pragma HLS inline
    __STREAM_T__ tmp = din;
    bool full_n =
    __fpga_axis_nb_push(&V.data, ((int*)0), ((int*)0),
    					&V.user, &V.last, ((int*)0), ((int*)0),
                        &tmp.data, ((int*)0), ((int*)0),
                        &tmp.user, &tmp.last, ((int*)0), ((int*)0));
    return full_n;
  }

  /// Fifo size
  //inline unsigned size() {
  //  unsigned size = __fpga_axis_size(&V);
  //  return size;
  //}

  __STREAM_T__ V;
};
}
#endif
#endif


#endif
