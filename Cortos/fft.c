// /* Factored discrete Fourier transform, or FFT, and its inverse iFFT */

// #include <assert.h>
// #include <stdio.h>
// #include <stdlib.h>
// #include <stdint.h>
// #include <math.h>
// #ifdef USE_CORTOS
// #include <cortos.h>
// #else
// #include <core_portme.h>
// #endif
// #include <thread_channel.h>
// #include <ajit_access_routines.h>
// #include <data_structs.h>

// #include <ntt.h>

// volatile ThreadChannel volatile tc;

// // volatile xfftArgs volatile fft_args;
// // volatile xtwiddleFactorArgs volatile twiddle_args;

// // void twiddle_factors(int inv_flag, int start_index, int stride, complex* v, complex* vo, complex* ve, int n)
// // {
// // 	PRINTF("[INFO:] twiddle_factors");
// // }

// typedef struct thread_args{

//     uint32_t *x;
//     uint32_t *psis;

// } thread_args;

// void set_NTT_Args(thread_args *args, uint32_t *x, uint32_t *psis)
// {
// 	args->x = x;
// 	args->psis = psis;
// }


// void ntt_thread(void* args){
//     PRINTF("[INFO] : NTT_THREAD entered\n");
//     uint32_t *x = ((thread_args*) args) -> x;
//     uint32_t *psis = ((thread_args*) args) -> psis;
//     uint16_t i;
    
//     // PRINTF("[INFO]   :   Performing NTT on:\n");
//     // Print the received input
//     // for( i = 0; i < 128; i++) {
//     //     PRINTF("%d ", x[i]);
//     // }
//     // PRINTF("\n");
    
//     // Perform NTT
//     // ct_ntt(x, psis);

//     PRINTF("[INFO] : NTT_THREAD exited\n");
// }



// // void fft_top(complex* v, int n, complex* tmp)
// // {
// // 	volatile ThreadChannel* volatile tc_ptr = &tc;
// // 	int k,m;    complex z, w, *vo, *ve;
// // 	ve = tmp; vo = tmp+n/2;

// // 	// fft( ve, n/2, v );		/* FFT on even-indexed elements of v[] */
// // 	setXfftArgs(&fft_args, n/2, ve, v);
// // 	while(scheduleChannelJob(tc_ptr, (void*) fft_thread, &fft_args))
// // 	{
// // 	};

// // 	// local execution..
// // 	fft( vo, n/2, (v + n/2));		/* FFT on odd-indexed elements of v[] */



// // 	void* vptr = NULL;
// // 	while(getChannelResponse(tc_ptr, &vptr))
// // 	{
// // 	}


// // 	// on sidekick
// // 	setXtwiddleArgs(&twiddle_args, 
// // 			0,
// // 			n,
// // 			0,
// // 			2,
// // 			v, vo, ve);
// // 	while(scheduleChannelJob(tc_ptr, (void*) twiddle_factors_thread, &twiddle_args))
// // 	{
// // 	}

// // 	// locally.
// // 	twiddle_factors(0,1,2,v,vo,ve, n);

// // 	vptr = NULL;
// // 	while(getChannelResponse(tc_ptr, &vptr))
// // 	{
// // 	}

// // }

// void ntt_top(uint32_t *x, uint32_t *psis){

//     volatile ThreadChannel* volatile tc_ptr = &tc;
//     volatile thread_args volatile ntt_args;
//     int i;
//     uint32_t xe[128], xo[128];

//     PRINTF("[INFO] : NTT_TOP Entered\n");

//     // for(i = 0; i < 128; i++){
//     //     PRINTF("X Array [%d] - %d\n", i, x[i]);
//     // }

//     // for(i = 0; i < 128; i++){
//     //     PRINTF("psis Array [%d] - %d\n", i, psis[i]);
//     // }


//     //Divide the array
//     for (i = 0; i < 128; i++){
//         xe[i] = x[2*i];
//         xo[i] = x[2*i+1];    
//     }

//     // for(i = 0; i < 128; i++){
//     //     PRINTF("xe Array [%d] - %d\n", i, xe[i]);
//     // }

//     // for(i = 0; i < 128; i++){
//     //     PRINTF("xo Array [%d] - %d\n", i, xo[i]);
//     // }

//     //NTT on Even indices - running on a thread
//     set_NTT_Args(&ntt_args, xe, psis);
// 	while(scheduleChannelJob(tc_ptr, (void*) ntt_thread, &ntt_args))
// 	{
//         // PRINTF("[INFO] : NTT_TOP still running 1\n");
// 	};   

//     //NTT on Odd indices - running locally
//     ct_ntt(xo, psis);

// 	void* vptr = NULL;
// 	while(getChannelResponse(tc_ptr, &vptr))
// 	{
//         // PRINTF("[INFO] : NTT_TOP waiting for response\n");
// 	}

//     PRINTF("[INFO] : NTT_TOP Exiting\n");

// }




// /* 
//    fft(v,N):
//    [0] If N==1 then return.
//    [1] For k = 0 to N/2-1, let ve[k] = v[2*k]
//    [2] Compute fft(ve, N/2);
//    [3] For k = 0 to N/2-1, let vo[k] = v[2*k+1]
//    [4] Compute fft(vo, N/2);
//    [5] For m = 0 to N/2-1, do [6] through [9]
//    [6]   Let w.re = cos(2*PI*m/N)
//    [7]   Let w.im = -sin(2*PI*m/N)
//    [8]   Let v[m] = ve[m] + w*vo[m]
//    [9]   Let v[m+N/2] = ve[m] - w*vo[m]
//  */
// // 	void
// // fft( complex *v, int n, complex *tmp )
// // {
// // 	if(n>1) {			/* otherwise, do nothing and return */
// // 		int k,m;    complex z, w, *vo, *ve;
// // 		ve = tmp; vo = tmp+n/2;
// // 		// for(k=0; k<n/2; k++) {
// // 		// 	ve[k] = v[2*k];
// // 		// 	vo[k] = v[2*k+1];
// // 		// }
// // 		// fft( ve, n/2, v );		/* FFT on even-indexed elements of v[] */
// // 		// fft( vo, n/2, v );		/* FFT on odd-indexed elements of v[] */

// // 	PRINTF("[INFO:] fft");

// // 		twiddle_factors(0,0,1,v, vo,ve, n);
// // 	}
// // 	return;
// // }
// // 
// // /* 
// //    ifft(v,N):
// //    [0] If N==1 then return.
// //    [1] For k = 0 to N/2-1, let ve[k] = v[2*k]
// //    [2] Compute ifft(ve, N/2);
// //    [3] For k = 0 to N/2-1, let vo[k] = v[2*k+1]
// //    [4] Compute ifft(vo, N/2);
// //    [5] For m = 0 to N/2-1, do [6] through [9]
// //    [6]   Let w.re = cos(2*PI*m/N)
// //    [7]   Let w.im = sin(2*PI*m/N)
// //    [8]   Let v[m] = ve[m] + w*vo[m]
// //    [9]   Let v[m+N/2] = ve[m] - w*vo[m]
// //  */
// // 	void
// // ifft( complex *y, int n, complex *tmp )
// // {
// // 	// if(n>1) {			/* otherwise, do nothing and return */
// // 	// 	int k,m;    complex z, w, *vo, *ve;
// // 	// 	ve = tmp; vo = tmp+n/2;
// // 	// 	for(k=0; k<n/2; k++) {
// // 	// 		ve[k] = v[2*k];
// // 	// 		vo[k] = v[2*k+1];
// // 	// 	}
// // 	// 	ifft( ve, n/2, v );		/* FFT on even-indexed elements of v[] */
// // 	// 	ifft( vo, n/2, v );		/* FFT on odd-indexed elements of v[] */

// // 	// 	twiddle_factors(1,0,1,v,vo,ve,n);
// // 	// }

// // 	PRINTF("[INFO:] ifft");
// // 	return;
// // }
// // 
// // 	void
// // ifft_top( complex *v, int n, complex *tmp )
// // {
// // 	int k,m;    complex z, w, *vo, *ve;
// // 	ve = tmp; vo = tmp+n/2;
// // 	for(k=0; k<n/2; k++) {
// // 		ve[k] = v[2*k];
// // 		vo[k] = v[2*k+1];
// // 	}

// // 	// ifft( ve, n/2, v );		/* FFT on even-indexed elements of v[] */
// // 	setXfftArgs(&fft_args, n/2, ve, v);
// // 	scheduleChannelJob(&tc, (void*) ifft_thread, &fft_args);

// // 	ifft( vo, n/2, (v + n/2));		/* FFT on odd-indexed elements of v[] */


// // 	void* vptr = NULL;
// // 	while(getChannelResponse(&tc, &vptr))
// // 	{
// // 	}

// // 	// on sidekick, even m values...
// // 	setXtwiddleArgs(&twiddle_args, 
// // 			1,
// // 			n,
// // 			0,
// // 			2,
// // 			v, vo, ve);
// // 	scheduleChannelJob(&tc, (void*) twiddle_factors_thread, &twiddle_args);


// // 	// odd m values.
// // 	twiddle_factors(1, 1,2,v,vo,ve,n);
	


// // 	vptr = NULL;
// // 	while(getChannelResponse(&tc, &vptr))
// // 	{
// // 	}

// // }


// void setup()
// {
// 	__ajit_serial_configure__(1,0,0);
// 	__ajit_serial_set_baudrate__ (115200, 80000000);
// 	__ajit_serial_set_uart_reset__ (0);

// 	PRINTF("Init channel.\n");
// 	// initialize scoreboard.
// 	initChannel(&tc, 1);

// 	PRINTF("initChannel %d: status=%d.\n", tc.id, tc.status);
// }

// // volatile complex volatile vg[N];
// // volatile complex volatile v1g[N];
// // // volatile complex volatile scratchg[N];
// // void set_values()
// // {
// // 	int k;

// // 	/* Fill v[] with a function of known FFT: */
// // 	for(k=0; k<N; k++) {
// // 		vg[k].Re = 0.125*cos(2*PI*k/(double)N);
// // 		vg[k].Im = 0.125*sin(2*PI*k/(double)N);
// // 		v1g[k].Re =  0.3*cos(2*PI*k/(double)N);
// // 		v1g[k].Im = -0.3*sin(2*PI*k/(double)N);
// // 	}
// // }


// int main_00()
// {
// 	// int k;

// 	uint32_t psis[256] =  {
//         1, 1729, 2580, 3289, 2642, 630, 1897, 848, 1062, 1919, 193, 797, 2786, 3260, 569, 1746, 296, 2447, 1339, 1476, 3046, 56, 2240, 1333, 1426, 2094, 535, 2882, 2393, 2879, 1974, 821, 289, 331, 3253, 1756, 1197, 2304, 2277, 2055, 650, 1977,
//         2513, 632, 2865, 33, 1320, 1915, 2319, 1435, 807, 452, 1438, 2868, 1534, 2402,
//         2647, 2617, 1481, 648, 2474, 3110, 1227, 910, 17, 2761, 583, 2649, 1637, 723,
//         2288, 1100, 1409, 2662, 3281, 233, 756, 2156, 3015, 3050, 1703, 1651, 2789, 1789,
//         1847, 952, 1461, 2687, 939, 2308, 2437, 2388, 733, 2337, 268, 641, 1584, 2298,
//         2037, 3220, 375, 2549, 2090, 1645, 1063, 319, 2773, 757, 2099, 561, 2466, 2594,
//         2804, 1092, 403, 1026, 1143, 2150, 2775, 886, 1722, 1212, 1874, 1029, 2110, 2935,
//         885, 2154
//         };

//     uint32_t x[256] = {0, 1, 0, 0, 0, 0, 1, 3327, 0, 3328, 3328, 1, 2, 1, 3328, 1, 1, 0, 3328, 0,
//         1, 0, 3326, 3328, 1, 3327, 2, 0, 1, 1, 0, 0, 3328, 3328, 1, 3328, 1, 0, 0, 3328, 2, 
//         2, 3327, 1, 2, 0, 0, 1, 0, 0, 0, 0, 1, 3328, 1, 1, 0, 0, 0, 0, 1, 1, 3328, 1, 0, 0, 
//         1, 3328, 0, 0, 2, 0, 0, 0, 3328, 3327, 3327, 0, 3328, 3328, 0, 3327, 1, 3328, 1, 3328, 
//         0, 2, 0, 3327, 1, 0, 1, 1, 0, 0, 3327, 3328, 0, 1, 0, 0, 3328, 0, 0, 3328, 3328, 0, 
//         3328, 3327, 1, 1, 3328, 0, 1, 1, 3328, 0, 3328, 3326, 0, 0, 3328, 0, 2, 3328, 0, 1, 
//         0, 0, 2, 3328, 0, 3328, 3328, 0, 0, 0, 1, 2, 3328, 3327, 1, 0, 2, 2, 2, 3327, 2, 0, 
//         0, 1, 0, 3328, 3328, 0, 1, 0, 0, 0, 3328, 3328, 1, 3, 3328, 1, 3328, 2, 0, 0, 0, 2, 
//         0, 1, 1, 3328, 1, 0, 3328, 3328, 0, 3328, 3328, 1, 3328, 3327, 1, 0, 1, 3328, 1, 3328, 
//         1, 3328, 1, 0, 3327, 3328, 1, 3, 3327, 0, 1, 3327, 3, 0, 1, 1, 1, 1, 3327, 3328, 3328, 
//         3328, 1, 3326, 0, 1, 1, 1, 0, 0, 1, 0, 0, 2, 0, 3328, 3328, 3328, 1, 3, 3328, 0, 3328, 
//         2, 1, 3327, 0, 1, 1, 0, 3327, 3328, 1, 1, 0, 3328, 3328, 3328, 0, 3328, 0, 0, 3328, 0};
    

// 	// measure on single thread.
// 	// set_values();
// 	uint64_t t00_0 =__ajit_get_clock_time();
// 	ntt_256(x,psis);
// 	uint64_t t00_1 = __ajit_get_clock_time();
// 	// print_vector("Single-thread NTT ", x, 256);

// 	PRINTF("Single thread Times: %f %f\n",
// 			(double) (t00_1 - t00_0));


// 	// measure on two threads

// 	uint64_t t0 =__ajit_get_clock_time();
// 	ntt_top(x, psis);
// 	uint64_t t1 =__ajit_get_clock_time();
// 	// print_vector(" NTT Top\n", x, 128);

// 	// close the channel..
// 	scheduleChannelJob(&tc, NULL, NULL);

// 	return(1);
// }

// int main_01 ()
// {
// 	void (*__fn) (void*);
// 	void *__arg;

// 	PRINTF("Entered main_01\n");

// 	while(1) 
// 	{
// 		while(getChannelJob(&tc, (void**) &__fn, (void**) &__arg))
// 		{
// 		}

// 		if(__fn != NULL)
// 		{
// 			(*__fn)(__arg);
// 			setChannelResponse(&tc, __arg);
// 		}
// 		else
// 			break;
// 	}

// 	return(1);

// }

