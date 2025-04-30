#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
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

#include "ntt.h"

volatile int volatile done_0 = 0, done_1 = 0;


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
    // cortos_printf("ct_ntt started execution\n");
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
//     cortos_printf(" Inside function, PSIS array:\n");
//     for (uint16_t x = 0; x < n; x++) {
//         cortos_printf("%u ", psis[x]);
//     }
//     cortos_printf("\n");

//     // Print the INV_PSIS array
//     cortos_printf("Inside function, INV_PSIS array:\n");
//     for (uint16_t x = 0; x < n; x++) {
//         cortos_printf("%u ", inv_psis[x]);
//     }
//     cortos_printf("\n");

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
    cortos_printf("[INFO]  :   NTT_256 Executing\n");
}