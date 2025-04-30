#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <cortos.h>
#include <thread_channel.h>
#include <ajit_access_routines.h>

//satvik headers
#include <ntt.h>

volatile ThreadChannel volatile tc;

typedef struct thread_args{

    uint16_t *x;
    uint16_t *psis;

} thread_args;

void set_NTT_Args(thread_args *args, uint16_t *x, uint16_t *psis)
{
	args->x = x;
	args->psis = psis;
}


void ntt_thread(void* args){
    uint16_t *x = ((thread_args*) args) -> x;
    uint16_t *psis = ((thread_args*) args) -> psis;
    uint16_t i;
    
    // cortos_printf("[INFO]  :   Performing NTT on:\n");
    // Print the received input
    // for( i = 0; i < 128; i++) {
    //     cortos_printf("%d ", x[i]);
    // }
    // cortos_printf("\n");
    
    // Perform NTT
    ct_ntt(x, psis);

    // cortos_printf("[INFO]  :   NTT_THREAD running\n");
}

void ntt_top(uint16_t *x, uint16_t *psis){

    volatile ThreadChannel* volatile tc_ptr = &tc;
    volatile thread_args volatile ntt_args;
    uint8_t i;
    uint16_t xe[128], xo[128];

    // cortos_printf("[INFO]  :    NTT_TOP Entered\n");

    // cortos_printf("[INFO]  :    X Array\n");
    // for(i = 0; i < 128; i++){
    //     cortos_printf("%d, ", x[i]);
    // }

    // cortos_printf("\n");

    // cortos_printf("[INFO]  :    PSIS Array\n");

    // for(i = 0; i < 128; i++){
    //     cortos_printf("%d, ", psis[i]);
    // }


    // cortos_printf("\n");


    //Divide the array
    for (i = 0; i < 128; i++){
        xe[i] = x[2*i];
        xo[i] = x[2*i+1];    
    }

    // for(i = 0; i < 128; i++){
    //     cortos_printf("xe Array [%d] - %d\n", i, xe[i]);
    // }

    // for(i = 0; i < 128; i++){
    //     cortos_printf("xo Array [%d] - %d\n", i, xo[i]);
    // }

    // cortos_printf("[INFO]  :   NTT on Even indices - running on a thread\n");
    
    set_NTT_Args(&ntt_args, xe, psis);
	while(scheduleChannelJob(tc_ptr, (void*) ntt_thread, &ntt_args))
	{
        // cortos_printf("[INFO] : NTT_TOP still running 1\n");
	};   

    // cortos_printf("[INFO]  :   NTT on Odd indices - running locally\n");
    ct_ntt(xo, psis);

	void* vptr = NULL;
	while(getChannelResponse(tc_ptr, &vptr))
	{
        // cortos_printf("[INFO] : NTT_TOP waiting for response\n");
	}

    // cortos_printf("[INFO] : NTT_TOP Exiting\n");

}

void setup()
{
	__ajit_serial_configure__(1,0,0);
	__ajit_serial_set_baudrate__ (115200, 80000000);
	__ajit_serial_set_uart_reset__ (0);

	// cortos_printf("Init channel.\n");
	// initialize scoreboard.
	initChannel(&tc, 1);

	// cortos_printf("initChannel %d: status=%d.\n", tc.id, tc.status);
}

uint8_t main_00()
{

    uint8_t i,j;

	// uint16_t psis[256] =  {
    //     1, 1729, 2580, 3289, 2642, 630, 1897, 848, 1062, 1919, 193, 797, 2786, 3260, 569, 1746,
    //     296, 2447, 1339, 1476, 3046, 56, 2240, 1333, 1426, 2094, 535, 2882, 2393, 2879, 1974, 
    //     821, 289, 331, 3253, 1756, 1197, 2304, 2277, 2055, 650, 1977,
    //     2513, 632, 2865, 33, 1320, 1915, 2319, 1435, 807, 452, 1438, 2868, 1534, 2402,
    //     2647, 2617, 1481, 648, 2474, 3110, 1227, 910, 17, 2761, 583, 2649, 1637, 723,
    //     2288, 1100, 1409, 2662, 3281, 233, 756, 2156, 3015, 3050, 1703, 1651, 2789, 1789,
    //     1847, 952, 1461, 2687, 939, 2308, 2437, 2388, 733, 2337, 268, 641, 1584, 2298,
    //     2037, 3220, 375, 2549, 2090, 1645, 1063, 319, 2773, 757, 2099, 561, 2466, 2594,
    //     2804, 1092, 403, 1026, 1143, 2150, 2775, 886, 1722, 1212, 1874, 1029, 2110, 2935,
    //     885, 2154
    //     };

    uint16_t x[256] = {0, 1, 0, 0, 0, 0, 1, 3327, 0, 3328, 3328, 1, 2, 1, 3328, 1, 1, 0, 3328, 0,
        1, 0, 3326, 3328, 1, 3327, 2, 0, 1, 1, 0, 0, 3328, 3328, 1, 3328, 1, 0, 0, 3328, 2, 
        2, 3327, 1, 2, 0, 0, 1, 0, 0, 0, 0, 1, 3328, 1, 1, 0, 0, 0, 0, 1, 1, 3328, 1, 0, 0, 
        1, 3328, 0, 0, 2, 0, 0, 0, 3328, 3327, 3327, 0, 3328, 3328, 0, 3327, 1, 3328, 1, 3328, 
        0, 2, 0, 3327, 1, 0, 1, 1, 0, 0, 3327, 3328, 0, 1, 0, 0, 3328, 0, 0, 3328, 3328, 0, 
        3328, 3327, 1, 1, 3328, 0, 1, 1, 3328, 0, 3328, 3326, 0, 0, 3328, 0, 2, 3328, 0, 1, 
        0, 0, 2, 3328, 0, 3328, 3328, 0, 0, 0, 1, 2, 3328, 3327, 1, 0, 2, 2, 2, 3327, 2, 0, 
        0, 1, 0, 3328, 3328, 0, 1, 0, 0, 0, 3328, 3328, 1, 3, 3328, 1, 3328, 2, 0, 0, 0, 2, 
        0, 1, 1, 3328, 1, 0, 3328, 3328, 0, 3328, 3328, 1, 3328, 3327, 1, 0, 1, 3328, 1, 3328, 
        1, 3328, 1, 0, 3327, 3328, 1, 3, 3327, 0, 1, 3327, 3, 0, 1, 1, 1, 1, 3327, 3328, 3328, 
        3328, 1, 3326, 0, 1, 1, 1, 0, 0, 1, 0, 0, 2, 0, 3328, 3328, 3328, 1, 3, 3328, 0, 3328, 
        2, 1, 3327, 0, 1, 1, 0, 3327, 3328, 1, 1, 0, 3328, 3328, 3328, 0, 3328, 0, 0, 3328, 0};

    uint16_t psis[128], inv_psis[128];
    gen_tf(psis, inv_psis);
    cortos_printf("[INFO]  :   Twiddle factors generated.\n");

    //  // Print the PSIS array
    // cortos_printf("[INFO]   :   PSIS array:\n");
    // for (i = 0; i < 128; i++) {
    //     cortos_printf("%u, ", psis[i]);
    // }
    // cortos_printf("\n");

    // // Print the INV_PSIS array
    // cortos_printf("[INFO]   :   INV_PSIS array:\n");
    // for (i = 0; i < n; i++) {
    //     cortos_printf("%u ", inv_psis[i]);
    // }
    // cortos_printf("\n");
	
	// cortos_printf("[INFO]  :   measure on single thread.\n");
	uint64_t t00_0 =__ajit_get_clock_time();
	ntt_256(x,psis);
	uint64_t t00_1 = __ajit_get_clock_time();

	cortos_printf("[RESULT]  :   Single thread Times: %f %f\n", (double) (t00_1 - t00_0));
    
    // cortos_printf("[RESULT]  :   Single-thread NTT:\n");
    // for(j = 0; j < 1; j++){
    //     cortos_printf("%u, ", x[j]);
    // }
    // cortos_printf("\n");

	cortos_printf("[INFO]  :   Dual-thread NTT measure on two threads starts here.\n");

	uint64_t t0 =__ajit_get_clock_time();
	ntt_top(x, psis);
	uint64_t t1 =__ajit_get_clock_time();
    cortos_printf("\n");

    // cortos_printf("[INFO]  :   Single-thread NTT measure on two threads done.\n");

	cortos_printf("[RESULT]  :   Dual thread Times: %f %f\n", (double) (t1 - t0));
    // cortos_printf("[RESULT]  :   Dual-thread NTT\n");
    // for(i = 0; i < 1; i++){
    //     cortos_printf("%d, ", x[i]);
    // }
    // cortos_printf("\n");
	
	cortos_printf("[INFO]  :   close the channel..\n");
	scheduleChannelJob(&tc, NULL, NULL);

	return(1);
}

uint8_t main_01 ()
{
	void (*__fn) (void*);
	void *__arg;

	// cortos_printf("------------------------------------------------------\n");
	cortos_printf("[INFO]   :   Entered main_01\n");
	// cortos_printf("------------------------------------------------------\n");

	while(1) 
	{
		while(getChannelJob(&tc, (void**) &__fn, (void**) &__arg))
		{
		}

		if(__fn != NULL)
		{
			(*__fn)(__arg);
			setChannelResponse(&tc, __arg);
		}
		else
			break;
	}

	return(1);

}

