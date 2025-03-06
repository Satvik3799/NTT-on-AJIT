// #ifndef NTT_H
// #define NTT_H

// #include <stdint.h>
// #include <stdbool.h>

// // Define necessary constants
// #define q 3329
// #define n2 256
// #define n 128
// #define inv_n 3303
// #define psin 17
// #define inv_psin 1175
// #define k 2

// // Function prototypes
// uint32_t bit_reverse(uint32_t num, uint32_t logn);
// uint32_t barret_reduction(uint32_t c1);
// void addr_gen(uint32_t s, uint32_t i, uint32_t l, uint32_t v, uint32_t *ie_r, uint32_t *io_r, uint32_t *iw);
// void butterfly_dit(uint32_t w, uint32_t u, uint32_t v, uint32_t *x, uint32_t *y);
// void ct_ntt(uint32_t *a, uint32_t *psis);
// void gen_tf(uint32_t *psis, uint32_t *inv_psis);
// void ntt_256(uint32_t *x, uint32_t *psis);

// #endif // NTT_H
