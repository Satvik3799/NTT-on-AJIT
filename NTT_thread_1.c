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

// typedef struct thread_args{

//     uint32_t *x_0, *x, *x_1;
//     uint32_t *psis;

// } thread_args;

// // void setup() {
// //     __ajit_serial_configure__(1, 0, 0);
// //     __ajit_serial_set_baudrate__(115200, 80000000);
// //     __ajit_serial_set_uart_reset__(0);

// // 	cortos_printf("Init channel.\n");
// // 	// initialize scoreboard.
// // 	initChannel(&tc, 1);

// // }


// void set_NTT_Args(thread_args *args, uint32_t *x, uint32_t *psis)
// {
// 	args->x = x;
// 	args->psis = psis;
// }

// void ntt_thread(void* args){
//     cortos_printf("[INFO]   :   NTT_THREAD entered\n");
//     uint32_t *x = ((thread_args*) args) -> x;
//     uint32_t *psis = ((thread_args*) args) -> psis;
//     uint16_t i;
    
//     // cortos_printf("[INFO]   :   Performing NTT on:\n");
//     // Print the received input
//     // for( i = 0; i < 128; i++) {
//     //     cortos_printf("%d ", x[i]);
//     // }
//     // cortos_printf("\n");
    
//     // Perform NTT
//     ct_ntt(x, psis);

//     cortos_printf("[INFO]   :   NTT_THREAD exited\n");
// }


// void ntt_top(uint32_t *x, uint32_t *psis){

//     volatile ThreadChannel* volatile tc_ptr = &tc;
//     volatile thread_args volatile ntt_args;
//     int i;
//     uint32_t xe[128], xo[128];

//     cortos_printf("[INFO]   :   NTT_TOP Entered\n");

//     // for(i = 0; i < 128; i++){
//     //     cortos_printf("X Array [%d] - %d\n", i, x[i]);
//     // }

//     // for(i = 0; i < 128; i++){
//     //     cortos_printf("psis Array [%d] - %d\n", i, psis[i]);
//     // }


//     //Divide the array
//     for (i = 0; i < 128; i++){
//         xe[i] = x[2*i];
//         xo[i] = x[2*i+1];    
//     }

//     // for(i = 0; i < 128; i++){
//     //     cortos_printf("xe Array [%d] - %d\n", i, xe[i]);
//     // }

//     // for(i = 0; i < 128; i++){
//     //     cortos_printf("xo Array [%d] - %d\n", i, xo[i]);
//     // }

//     //NTT on Even indices - running on a thread
//     set_NTT_Args(&ntt_args, xe, psis);
// 	while(scheduleChannelJob(tc_ptr, (void*) ntt_thread, &ntt_args))
// 	{
//         // cortos_printf("[INFO] : NTT_TOP still running 1\n");
// 	};   

//     cortos_printf("[INFO] : xo array before ct_ntt\n");

//     for(i=0; i<128 ; i++){
//         cortos_printf("%d ", xo[i]);
//     }

//     //NTT on Odd indices - running locally
//     ct_ntt(xo, psis);
// 	void* vptr = NULL;
// 	while(getChannelResponse(tc_ptr, &vptr))
// 	{
//         // cortos_printf("[INFO]   :   NTT_TOP waiting for response\n");
// 	}

//     cortos_printf("[INFO] : xo array after ct_ntt\n");

//     for(i=0; i<128 ; i++){
//         cortos_printf("%d ", xo[i]);
//     }

//     cortos_printf("[INFO]   :   NTT_TOP Exiting\n");
// }

// void setup()
// {
// 	__ajit_serial_configure__(1,0,0);
// 	__ajit_serial_set_baudrate__ (115200, 80000000);
// 	__ajit_serial_set_uart_reset__ (0);

// 	cortos_printf("[INFO] : Init channel\n");
// 	// initialize scoreboard.
// 	initChannel(&tc, 1);

// 	cortos_printf("[INFO] : initChannel %d: status=%d\n", tc.id, tc.status);
// }

// volatile uint32_t volatile vg[128];
// volatile uint32_t volatile v1g[128];
// volatile uint32_t volatile scratchg[128];

// int main_00()
// {

//     // cortos_printf("[INFO] : --------------------------------------------------------------------------------\n");
//     // cortos_printf("[INFO] : ---------------------------Logs Start Here--------------------------------------\n");
//     // cortos_printf("[INFO] : --------------------------------------------------------------------------------\n");
        
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

//     uint32_t x_0[256] = {0, 1, 0, 0, 0, 0, 1, 3327, 0, 3328, 3328, 1, 2, 1, 3328, 1, 1, 0, 3328, 0,
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

//     uint32_t x_1[256] = {0, 1, 0, 0, 0, 0, 1, 3327, 0, 3328, 3328, 1, 2, 1, 3328, 1, 1, 0, 3328, 0,
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

//     // cortos_printf("[INFO]   :   x_0 array before NTT_256\n");

//     // for(i=0; i<128 ; i++){
//     //     cortos_printf("%d ", x_0[i]);
//     // }


// 	uint64_t t00_0 =__ajit_get_clock_time(); // Begin timer
//     //ntt 256 here
//     ntt_256(x_0, psis);   
//     uint64_t t00_1 = __ajit_get_clock_time(); // End timer


//     // cortos_printf("[INFO] : --------------------------------------------------------------------------------\n");
//     // cortos_printf("[INFO] : -----------------------------Single Thread--------------------------------------\n");
//     // cortos_printf("[INFO] : --------------------------------------------------------------------------------\n");
        

// 	cortos_printf("[-- RESULT --] : Single thread Times: %f\n", (double) (t00_1 - t00_0));  
//     // cortos_printf("[-- Single Thread NTT RESULT Array --] \n");
//     // for(i = 0; i<256 ; i++){
//     //     cortos_printf("%d ", x_0[i]);
//     // }

// 	// measure on two threads
//     // cortos_printf("[INFO]   :   x_1 array before NTT_TOP\n");
//     // for(i=0; i<128 ; i++){
//     //     cortos_printf("%d ", x_0[i]);
//     // }

// 	uint64_t t0 =__ajit_get_clock_time();
// 	//NTT_TOP here
//     ntt_top(x_1, psis);
// 	uint64_t t1 =__ajit_get_clock_time();

//     // cortos_printf("[INFO]   :   x_1 array after NTT_TOP\n");
//     // for(i=0; i<128 ; i++){
//     //     cortos_printf("%d ", x_0[i]);
//     // }

//     // cortos_printf("[INFO] : --------------------------------------------------------------------------------\n");
//     // cortos_printf("[INFO] : -------------------------------Dual Thread--------------------------------------\n");
//     // cortos_printf("[INFO] : --------------------------------------------------------------------------------\n");
// 	cortos_printf("[-- RESULT --] : Dual thread Times: %f\n", (double) (t1 - t0)); 
//     // cortos_printf("[-- Dual Thread NTT RESULT Array --] \n");
//     // for(i = 0; i<256 ; i++){
//     //     cortos_printf("%d ", x_1[i]);
//     // }

// 	// close the channel..
// 	scheduleChannelJob(&tc, NULL, NULL);

// 	return(1);
// }

// int main_01 ()
// {
// 	void (*__fn) (void*);
// 	void *__arg;

// 	cortos_printf("[INFO] : Entered main_01\n");

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

