#ifndef NTT_H
#define NTT_H

#include <stdint.h>
#include <stdbool.h>

// Define necessary constants
#define q 3329
#define n2 256
#define n 128
#define inv_n 3303
#define psin 17
#define inv_psin 1175
#define k 2

// Function prototypes
uint16_t bit_reverse(uint16_t num, uint16_t logn);
uint16_t barret_reduction(uint16_t c1);
void addr_gen(uint16_t s, uint16_t i, uint16_t l, uint16_t v, uint16_t *ie_r, uint16_t *io_r, uint16_t *iw);
void butterfly_dit(uint16_t w, uint16_t u, uint16_t v, uint16_t *x, uint16_t *y);
void ct_ntt(uint16_t *a, uint16_t *psis);
void gen_tf(uint16_t *psis, uint16_t *inv_psis);
void ntt_256(uint16_t *x, uint16_t *psis);

#endif // NTT_H
