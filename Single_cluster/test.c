/* 
 * Copyright (C) 2017 ETH Zurich, University of Bologna and GreenWaves Technologies
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou, ETH (germain.haugou@iis.ee.ethz.ch)
 */

#include "pmsis.h"
#include <time.h>

#include <stdint.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

// Define necessary constants
#define q 3329
#define n2 256
#define n 128
#define inv_n 3303
#define psin 17
#define inv_psin 1175
#define k 2

#if defined(CLUSTER)
void pe_entry(void *arg)
{
    printf("Hello from cluster_id: %d, core_id: %d\n", pi_cluster_id(), pi_core_id());
}

void cluster_entry(void *arg)
{
    pi_cl_team_fork((NUM_CORES), pe_entry, 0);
}
#endif

static int test_entry()
{
#if defined(CLUSTER)
    struct pi_device cluster_dev;
    struct pi_cluster_conf cl_conf;
    struct pi_cluster_task cl_task;

    pi_cluster_conf_init(&cl_conf);
    pi_open_from_conf(&cluster_dev, &cl_conf);
    if (pi_cluster_open(&cluster_dev))
    {
        return -1;
    }

    pi_cluster_send_task_to_cl(&cluster_dev, pi_cluster_task(&cl_task, cluster_entry, NULL));

    pi_cluster_close(&cluster_dev);
#endif
#if !defined(CLUSTER)
    uint32_t start, end, elapsed;
    double elapsed_seconds;
    


    uint16_t psis[n] =  {
        1, 1729, 2580, 3289, 2642, 630, 1897, 848, 1062, 1919, 193, 797, 2786, 3260, 569, 1746, 296, 2447, 1339, 1476, 3046, 56, 2240, 1333, 1426, 2094, 535, 2882, 2393, 2879, 1974, 821, 289, 331, 3253, 1756, 1197, 2304, 2277, 2055, 650, 1977,
        2513, 632, 2865, 33, 1320, 1915, 2319, 1435, 807, 452, 1438, 2868, 1534, 2402,
        2647, 2617, 1481, 648, 2474, 3110, 1227, 910, 17, 2761, 583, 2649, 1637, 723,
        2288, 1100, 1409, 2662, 3281, 233, 756, 2156, 3015, 3050, 1703, 1651, 2789, 1789,
        1847, 952, 1461, 2687, 939, 2308, 2437, 2388, 733, 2337, 268, 641, 1584, 2298,
        2037, 3220, 375, 2549, 2090, 1645, 1063, 319, 2773, 757, 2099, 561, 2466, 2594,
        2804, 1092, 403, 1026, 1143, 2150, 2775, 886, 1722, 1212, 1874, 1029, 2110, 2935,
        885, 2154
        };

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
        
    start = pos_time_get_us();
    
    ntt_256(x, psis); 
    //  printf("function_to_measure() execution time: %f seconds\n");
    // uint16_t i;

    // printf("\n");
    // for(i=0; i<256; i++){
    //     printf("%d ",psis[i]);
    // };
    // printf("\n");

    // uint16_t xe[128], xo[128];
    
    // for ( i = 0; i < 128; i++) {
    //     xe[i] = x[2 * i];
    //     xo[i] = x[2 * i + 1];
    // }
    // ct_ntt(xe, psis);
    // ct_ntt(xo, psis);
    // for ( i = 0; i < 128; i++) {
    //     x[i] = xe[i];
    //     x[i + 128] = xo[i];
    // }

    end = pos_time_get_us();
    elapsed_seconds = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("function_to_measure() execution time: %f seconds\n", elapsed_seconds);
#endif

    return 0;
}

static void test_kickoff(void *arg)
{
    int ret = test_entry();
    pmsis_exit(ret);
}



uint16_t bit_reverse(uint16_t num, uint16_t logn) {
    uint16_t rev_num = 0;
    uint16_t i;
    for (i = 0; i < logn; i++) {
        if ((num >> i) & 1) {
            rev_num |= 1 << (logn - 1 - i);
        }
    }
    return rev_num;
}

uint16_t barret_reduction(uint16_t c1) {
    uint16_t p = 0;
    uint16_t m = 5039;
    // uint16_t k = 24;
    uint64_t t123 = (uint64_t)m * c1;
    uint16_t t = t123 >> 24;
    uint64_t ta = (uint64_t)p * t;
    uint16_t c = c1 - ta;
    if (c > p) {
        c = c - p;
    }
    return c;
}

void addr_gen(uint16_t s, uint16_t i, uint16_t l, uint16_t v, uint16_t *ie_r, uint16_t *io_r, uint16_t *iw) {
    uint16_t j = s >> (l - 1 - i);
    uint16_t z = s & ((v >> i) - 1);
    *ie_r = j * (1 << (l - i)) + z;
    *io_r = *ie_r + (1 << (l - i - 1));
    *iw = (1 << i) + (s >> (l - i - 1));
}


void butterfly_dit(uint16_t w, uint16_t u, uint16_t v, uint16_t *x, uint16_t *y) {
    uint16_t v1 = barret_reduction((uint64_t)w * v % q);
    *x = (u + v1) % q;
    *y = (u - v1 + q) % q;
}


void ct_ntt(uint16_t *a, uint16_t *psis) {
    // printf("ct_ntt started execution\n");
    uint16_t l = (uint16_t)log2(n);
    uint16_t v = n / 2;
    uint16_t i,s;
    for ( i = 0; i < l; i++) {
        for ( s = 0; s < v; s++) {
            uint16_t ie, io, iw;
            addr_gen(s, i, l, v, &ie, &io, &iw);
            uint16_t S = psis[iw];
            uint16_t U = a[ie];
            uint16_t V = a[io];
            uint16_t x, y;
            butterfly_dit(S, U, V, &x, &y);
            a[ie] = x;
            a[io] = y;
        }
    }
}


//QC - Passed
void gen_tf(uint16_t *psis, uint16_t *inv_psis) {
    uint16_t logn = (uint16_t)log2(n);
    uint16_t tmp1[n], tmp2[n], positions[n];
    uint16_t x;
    for ( x = 0; x < n; x++) {
        positions[x] = bit_reverse(x, logn);
    }

    uint16_t psi = 1, inv_psi = 1;
    for ( x = 0; x < n; x++) {
        tmp1[x] = psi;
        tmp2[x] = inv_psi;
        psi = (uint64_t)psi * psin % q;
        inv_psi = (uint64_t)inv_psi * inv_psin % q;
    }

    for ( x = 0; x < n; x++) {
        psis[x] = tmp1[positions[x]];
        inv_psis[x] = tmp2[positions[x]];
    }

//      // Print the PSIS array
//     printf(" Inside function, PSIS array:\n");
//     for (uint16_t x = 0; x < n; x++) {
//         printf("%u ", psis[x]);
//     }
//     printf("\n");

//     // Print the INV_PSIS array
//     printf("Inside function, INV_PSIS array:\n");
//     for (uint16_t x = 0; x < n; x++) {
//         printf("%u ", inv_psis[x]);
//     }
//     printf("\n");

}


void  ntt_256(uint16_t *x, uint16_t *psis) {
    uint16_t xe[128], xo[128];
    uint16_t i;
    for ( i = 0; i < 128; i++) {
        xe[i] = x[2 * i];
        xo[i] = x[2 * i + 1];
    }
    ct_ntt(xe, psis);
    ct_ntt(xo, psis);
    for ( i = 0; i < 128; i++) {
        x[i] = xe[i];
        x[i + 128] = xo[i];
    }
}

int main()
{
    return pmsis_kickoff((void *)test_kickoff);
}



