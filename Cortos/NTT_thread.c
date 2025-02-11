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

// #include "ntt.h"

// volatile ThreadChannel volatile tc;

// volatile thread_args volatile ntt_args;

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

// 	uint32_t *x = ((thread_args*) args) -> x;
//     uint32_t *psis = ((thread_args*) args) -> psis;
    
//     CORTOS_DEBUG("[INFO] : Calling NTT\n");
//     ct_ntt(x, psis);

// }

// void ntt_top(uint32_t *x, uint32_t *psis){

//     volatile ThreadChannel* volatile tc_ptr = &tc;
//     int i;
//     uint32_t *xo, *xe;

//     //Divide the array
//     for (i = 0; i < 128; i++){
//         xe[i] = x[2*i];
//         xo[i] = x[2*i+1];    
//     }

//     //NTT on Even indices - running on a thread
//     set_NTT_Args(&ntt_args, xe, psis);
// 	while(scheduleChannelJob(tc_ptr, (void*) ntt_thread, &ntt_args))
// 	{
// 	};   

//     //NTT on Odd indices - running locally
//     ct_ntt(xo, psis);

// 	void* vptr = NULL;
// 	while(getChannelResponse(tc_ptr, &vptr))
// 	{
// 	}
// }

// void setup()
// {
// 	__ajit_serial_configure__(1,0,0);
// 	__ajit_serial_set_baudrate__ (115200, 80000000);
// 	__ajit_serial_set_uart_reset__ (0);

// 	CORTOS_DEBUG("[INFO] : Init channel.\n");
// 	// initialize scoreboard.
// 	initChannel(&tc, 1);

// 	CORTOS_DEBUG("[INFO] : initChannel %d: status=%d.\n", tc.id, tc.status);
// }

// volatile uint32_t volatile vg[128];
// volatile uint32_t volatile v1g[128];
// volatile uint32_t volatile scratchg[128];

// int main_00()
// {
// 	int i;

//     // Generate pre-computed factors
//     // gen_tf(psis, inv_psis);
// 	uint8_t core_id, thread_id;
// 	ajit_get_core_and_thread_id(&core_id, &thread_id);
//     __ajit_serial_configure__ (1,0,0);

//     uint32_t psis[n] =  {
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
    
//     uint16_t i;
//     ee_printf("[INFO] : Hello world from core:thread %d:%d!\n\n", core_id, thread_id);

	
// 	uint64_t t00_0 =__ajit_get_clock_time(); // Begin timer

//     //ct_ntt here
//     ct_ntt(x, psis);   
		
//     uint64_t t00_1 = __ajit_get_clock_time(); // End timer

// 	CORTOS_DEBUG("[-- RESULT --] : Single thread Times: %f\n", (double) (t00_1 - t00_0));  


// 	// measure on two threads
// 	uint64_t t0 =__ajit_get_clock_time();

// 	//NTT_TOP here

// 	uint64_t t1 =__ajit_get_clock_time();

	
// 	CORTOS_DEBUG("[-- RESULT --] : Dual thread Times: %f\n", (double) (t0 - t0)); 
// 	// close the channel..
// 	scheduleChannelJob(&tc, NULL, NULL);

// 	return(1);
// }

// int main_01 ()
// {
// 	void (*__fn) (void*);
// 	void *__arg;

// 	CORTOS_DEBUG("[INFO] : Entered main_01\n");

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

// // int main_single(void)
// // {

// // 	uint32_t i,j;	
// // 	// uint8_t core_id, thread_id;
// // 	// ajit_get_core_and_thread_id(&core_id, &thread_id);
// //     __ajit_serial_configure__ (1,0,0);
    

// //     // clock_t start, end;
// //     double cpu_time_used;

// //     uint32_t psis[n], inv_psis[n];

// //     // Generate pre-computed factors
// //     gen_tf(psis, inv_psis);

// //     // uint32_t psis[n] =  {
// //     //     1, 1729, 2580, 3289, 2642, 630, 1897, 848, 1062, 1919, 193, 797, 2786, 3260, 569, 1746, 296, 2447, 1339, 1476, 3046, 56, 2240, 1333, 1426, 2094, 535, 2882, 2393, 2879, 1974, 821, 289, 331, 3253, 1756, 1197, 2304, 2277, 2055, 650, 1977,
// //     //     2513, 632, 2865, 33, 1320, 1915, 2319, 1435, 807, 452, 1438, 2868, 1534, 2402,
// //     //     2647, 2617, 1481, 648, 2474, 3110, 1227, 910, 17, 2761, 583, 2649, 1637, 723,
// //     //     2288, 1100, 1409, 2662, 3281, 233, 756, 2156, 3015, 3050, 1703, 1651, 2789, 1789,
// //     //     1847, 952, 1461, 2687, 939, 2308, 2437, 2388, 733, 2337, 268, 641, 1584, 2298,
// //     //     2037, 3220, 375, 2549, 2090, 1645, 1063, 319, 2773, 757, 2099, 561, 2466, 2594,
// //     //     2804, 1092, 403, 1026, 1143, 2150, 2775, 886, 1722, 1212, 1874, 1029, 2110, 2935,
// //     //     885, 2154
// //     //     };

// //     uint32_t s0[n2] = {0, 1, 0, 0, 0, 0, 1, 3327, 0, 3328, 3328, 1, 2, 1, 3328, 1, 1, 0, 3328, 0,
// //         1, 0, 3326, 3328, 1, 3327, 2, 0, 1, 1, 0, 0, 3328, 3328, 1, 3328, 1, 0, 0, 3328, 2, 
// //         2, 3327, 1, 2, 0, 0, 1, 0, 0, 0, 0, 1, 3328, 1, 1, 0, 0, 0, 0, 1, 1, 3328, 1, 0, 0, 
// //         1, 3328, 0, 0, 2, 0, 0, 0, 3328, 3327, 3327, 0, 3328, 3328, 0, 3327, 1, 3328, 1, 3328, 
// //         0, 2, 0, 3327, 1, 0, 1, 1, 0, 0, 3327, 3328, 0, 1, 0, 0, 3328, 0, 0, 3328, 3328, 0, 
// //         3328, 3327, 1, 1, 3328, 0, 1, 1, 3328, 0, 3328, 3326, 0, 0, 3328, 0, 2, 3328, 0, 1, 
// //         0, 0, 2, 3328, 0, 3328, 3328, 0, 0, 0, 1, 2, 3328, 3327, 1, 0, 2, 2, 2, 3327, 2, 0, 
// //         0, 1, 0, 3328, 3328, 0, 1, 0, 0, 0, 3328, 3328, 1, 3, 3328, 1, 3328, 2, 0, 0, 0, 2, 
// //         0, 1, 1, 3328, 1, 0, 3328, 3328, 0, 3328, 3328, 1, 3328, 3327, 1, 0, 1, 3328, 1, 3328, 
// //         1, 3328, 1, 0, 3327, 3328, 1, 3, 3327, 0, 1, 3327, 3, 0, 1, 1, 1, 1, 3327, 3328, 3328, 
// //         3328, 1, 3326, 0, 1, 1, 1, 0, 0, 1, 0, 0, 2, 0, 3328, 3328, 3328, 1, 3, 3328, 0, 3328, 
// //         2, 1, 3327, 0, 1, 1, 0, 3327, 3328, 1, 1, 0, 3328, 3328, 3328, 0, 3328, 0, 0, 3328, 0};
    
// //         // uint16_t i;

// // 		// Print
// // 		// ee_printf("Hello world from core:thread %d:%d!\n\n", core_id, thread_id);

// //         // Perform NTT transform
 
// //         // Perform NTT transform
// //         // start = clock();
// //         ntt_256(s0, psis);
// //         // end = clock();
// //         //  // Calculate the elapsed time in seconds
// //         // cpu_time_used = (((double)(end - start)) / CLOCKS_PER_SEC) * 1000000;
// //         // ee_printf("Execution time: %f micro-seconds\n", cpu_time_used);

// //         ee_printf("Result of NTT function with s0:\n");
// //         for (i = 0; i < 256; i++) {
// //             ee_printf("%d ", s0[i]);
// //         }
// //         ee_printf("\n");    



// // 	return(0);

// // }
