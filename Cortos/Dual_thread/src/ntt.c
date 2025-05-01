
#include "core_portme.h"
#include "math.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#include <cortos.h>
#include <thread_channel.h>
#include <ajit_access_routines.h>

#include "utils.h"
#include "ntt.h"


#define n 128

void ct_ntt(uint16_t *a, uint16_t *psis) {
    // cortos_printf("ct_ntt started execution\n");
    uint8_t l = (uint8_t)log2(n);
    uint8_t v = n / 2;
    uint8_t i,s;
    for ( i = 0; i < l; i++) {
        for ( s = 0; s < v; s++) {
            uint16_t ie, io, iw;
            addr_gen(s, i, l, v, &ie, &io, &iw);
            uint16_t S = psis[iw];
            uint16_t U = a[ie];
            uint16_t V = a[io];
            uint16_t x, y;
            butterfly_dit(S, U, V, &x, &y);
            // cortos_printf("%d", s);
            a[ie] = x;
            a[io] = y;
        }

        // cortos_printf("-- %d --\n", i);
    }
    // cortos_printf("\n");
    // cortos_printf("ct_ntt finished execution\n");
}


// NTT and INTT for Single thread 256 point
void ntt_256(uint16_t *x, uint16_t *psis) {
    uint16_t xe[128], xo[128];
    uint16_t i;
    for ( i = 0; i < 128; i++) {
        xe[i] = x[2 * i];
        xo[i] = x[2 * i + 1];
    };
    ct_ntt(xe, psis);
    ct_ntt(xo, psis);
    for ( i = 0; i < 128; i++) {
        x[i] = xe[i];
        x[i + 128] = xo[i];
    };
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

    cortos_printf("[INFO]  :    NTT_TOP Entered\n");

    // cortos_printf("[INFO]  :    X Array\n");
    // for(i = 0; i < 128; i++){
    //     cortos_printf("%d, ", x[i]);
    // }

    // cortos_printf("\n");

    // cortos_printf("[INFO]  :    PSIS Array\n");

    // for(i = 0; i < 128; i++){
    //     cortos_printf("%d, ", psis[i]);
    // }


    cortos_printf("\n");


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

    // cortos_printf("[INFO]  :   NTT on Odd indices - running locally\n");

    ct_ntt(xo, psis);

    // cortos_printf("[INFO]  :   NTT on Even indices - running on a thread\n");
    
    set_NTT_Args(&ntt_args, xe, psis);
	while(scheduleChannelJob(tc_ptr, (void*) ntt_thread, &ntt_args))
	{
        // cortos_printf("[INFO] : NTT_TOP still running 1\n");
	};   


	void* vptr = NULL;
	while(getChannelResponse(tc_ptr, &vptr))
	{
        // cortos_printf("[INFO] : NTT_TOP waiting for response\n");
	}

    cortos_printf("[INFO] : NTT_TOP Exiting\n");

}
