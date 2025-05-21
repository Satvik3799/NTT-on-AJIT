#include <stdint.h>
#include "utils.h"
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
#include "intt.h"


// Define necessary constants
#define q 3329
#define n2 256
#define n 128
#define inv_n 3303
#define psin 17
#define inv_psin 1175

void gs_intt(uint32_t *a, uint32_t *inv_psis) {
    uint32_t i, s;
    // cortos_printf("Inside GS_INTT");
    // for( i = 0; i < 5; i++) {
    //     cortos_printf("%d ", inv_psis[i]);
    // }
    // cortos_printf("\n");
    uint32_t l = (uint32_t)log2(n);
    uint32_t v = n / 2;

    for ( i = 0; i < l; i++) {  
        for ( s = 0; s < v; s++) {
            uint32_t i2 = l - i - 1;
            uint32_t ie, io, iw;
            addr_gen(s, i2, l, v, &ie, &io, &iw);
            uint32_t S = inv_psis[iw];
            uint32_t U = a[ie];
            uint32_t V = a[io];
            uint32_t x, y;
            butterfly_dif(S, U, V, &x, &y);
            a[ie] = x;
            a[io] = y;
        }
    }
    for ( i = 0; i < n; i++) {
        a[i] = (uint32_t)a[i] * inv_n % q;
    }
}


void intt_256(uint32_t *y, uint32_t *inv_psis) {
    // cortos_printf("Inside INTT");
    uint32_t ye[n], yo[n];
    uint32_t i;
    for ( i = 0; i < n; i++) {
        ye[i] = y[i];
        yo[i] = y[i + n];
    }
    gs_intt(ye, inv_psis);
    gs_intt(yo, inv_psis);
    for ( i = 0; i < n; i++) {
        y[2 * i] = ye[i];
        y[2 * i + 1] = yo[i];
    }
}

void intt_512(uint32_t *y, uint32_t *inv_psis) {
    // cortos_printf("Inside INTT");
    uint32_t ye[n], yo[n];
    uint32_t i;
    for ( i = 0; i < n; i++) {
        ye[i] = y[i];
        yo[i] = y[i + n];
    }
    intt_256(ye, inv_psis);
    intt_256(yo, inv_psis);
    for ( i = 0; i < n; i++) {
        y[2 * i] = ye[i];
        y[2 * i + 1] = yo[i];
    }
}


void intt_thread(void* args){
    uint32_t *x = ((thread_args*) args) -> x;
    uint32_t *inv_psis = ((thread_args*) args) -> psis;
    // uint32_t i;
    
    // cortos_printf("[INFO]  :   Performing INTT on:\n");
    // Print the received input
    // for( i = 0; i < n; i++) {
    //     cortos_printf("%d ", x[i]);
    // }
    // cortos_printf("\n");
    
    // Perform NTT
    gs_intt(x, inv_psis);

    // cortos_printf("[INFO]  :   NTT_THREAD running\n");
}

void intt_top(uint32_t *x, uint32_t *inv_psis){

    volatile ThreadChannel* volatile tc_ptr = &tc;
    volatile thread_args volatile intt_args;
    uint32_t i;
    uint32_t xe[n], xo[n];

    // cortos_printf("[INFO]  :    NTT_TOP Entered\n");

    // cortos_printf("[INFO]  :    X Array\n");
    // for(i = 0; i < n; i++){
    //     cortos_printf("%d, ", x[i]);
    // }

    // cortos_printf("\n");

    // cortos_printf("[INFO]  :    PSIS Array\n");

    // for(i = 0; i < n; i++){
    //     cortos_printf("%d, ", psis[i]);
    // }


    // cortos_printf("\n");


    //Divide the array
    for ( i = 0; i < n; i++) {
        xe[i] = x[i];
        xo[i] = x[i + n];
    };

    // for(i = 0; i < n; i++){
    //     cortos_printf("xe Array [%d] - %d\n", i, xe[i]);
    // }

    // for(i = 0; i < n; i++){
    //     cortos_printf("xo Array [%d] - %d\n", i, xo[i]);
    // }

    // cortos_printf("[INFO]  :   NTT on Even indices - running on a thread\n");
    
    set_NTT_Args(&intt_args, xe, inv_psis);
	while(scheduleChannelJob(tc_ptr, (void*) intt_thread, &intt_args))
	{
        // cortos_printf("[INFO] : NTT_TOP still running 1\n");
	};   

    // cortos_printf("[INFO]  :   NTT on Odd indices - running locally\n");
    gs_intt(xo, inv_psis);

	void* vptr = NULL;
	while(getChannelResponse(tc_ptr, &vptr))
	{
        // cortos_printf("[INFO] : NTT_TOP waiting for response\n");
	}

    // cortos_printf("[INFO] : NTT_TOP Exiting\n");

    for ( i = 0; i < n; i++) {
        x[2 * i] = xe[i];
        x[2 * i + 1] = xo[i];
    }
}


