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


uint32_t bit_reverse(uint32_t num, uint32_t logn) {
    uint32_t rev_num = 0;
    uint32_t i;
    for (i = 0; i < logn; i++) {
        if ((num >> i) & 1) {
            rev_num |= 1 << (logn - 1 - i);
        }
    }
    return rev_num;
}

uint32_t barret_reduction(uint32_t c1) {
    uint32_t p = 0;
    uint32_t m = 5039;
    // uint32_t k = 24;
    uint64_t t123 = (uint64_t)m * c1;
    uint32_t t = t123 >> 24;
    uint64_t ta = (uint64_t)p * t;
    uint32_t c = c1 - ta;
    if (c > p) {
        c = c - p;
    }
    return c;
}

void addr_gen(uint32_t s, uint32_t i, uint32_t l, uint32_t v, uint32_t *ie_r, uint32_t *io_r, uint32_t *iw) {
    uint32_t j = s >> (l - 1 - i);
    uint32_t z = s & ((v >> i) - 1);
    *ie_r = j * (1 << (l - i)) + z;
    *io_r = *ie_r + (1 << (l - i - 1));
    *iw = (1 << i) + (s >> (l - i - 1));
}


void butterfly_dit(uint32_t w, uint32_t u, uint32_t v, uint32_t *x, uint32_t *y) {
    uint32_t v1 = barret_reduction((uint64_t)w * v % q);
    *x = (u + v1) % q;
    *y = (u - v1 + q) % q;
}


void ct_ntt(uint32_t *a, uint32_t *psis) {
    cortos_printf("ct_ntt started execution\n");
    uint32_t l = (uint32_t)log2(n);
    uint32_t v = n / 2;
    uint32_t i,s;
    for ( i = 0; i < l; i++) {
        for ( s = 0; s < v; s++) {
            uint32_t ie, io, iw;
            addr_gen(s, i, l, v, &ie, &io, &iw);
            uint32_t S = psis[iw];
            uint32_t U = a[ie];
            uint32_t V = a[io];
            uint32_t x, y;
            butterfly_dit(S, U, V, &x, &y);
            a[ie] = x;
            a[io] = y;
        }
    }
}


//QC - Passed
void gen_tf(uint32_t *psis, uint32_t *inv_psis) {
    uint32_t logn = (uint32_t)log2(n);
    uint32_t tmp1[n], tmp2[n], positions[n];
    uint32_t x;
    for ( x = 0; x < n; x++) {
        positions[x] = bit_reverse(x, logn);
    }

    uint32_t psi = 1, inv_psi = 1;
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
//     for (uint32_t x = 0; x < n; x++) {
//         printf("%u ", psis[x]);
//     }
//     printf("\n");

//     // Print the INV_PSIS array
//     printf("Inside function, INV_PSIS array:\n");
//     for (uint32_t x = 0; x < n; x++) {
//         printf("%u ", inv_psis[x]);
//     }
//     printf("\n");

}


void  ntt_256(uint32_t *x, uint32_t *psis) {
    uint32_t xe[128], xo[128];
    uint32_t i;
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