
#ifndef utils_H
#define utils_H

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


volatile ThreadChannel volatile tc;

typedef struct thread_args{

    uint32_t *x;
    uint32_t *psis;

} thread_args;



void print_progress();
// void print_1d_array(uint32_t arr[], uint32_t size);
void set_NTT_Args(thread_args *args, uint32_t *x, uint32_t *psis);
uint32_t bit_reverse(uint32_t num, uint32_t logn);
uint32_t barret_reduction(uint64_t c1);
void addr_gen(uint32_t s, uint32_t i, uint32_t l, uint32_t v, uint32_t *ie_r, uint32_t *io_r, uint32_t *iw);
void butterfly_dit(uint32_t w, uint32_t u, uint32_t v, uint32_t *x, uint32_t *y);
void butterfly_dif(uint32_t w, uint32_t u, uint32_t v, uint32_t *x, uint32_t *y);
//Output is y3 and y1, y2, pwmf are input arrays
void point_wise_mult(uint32_t *y3, uint32_t *y1, uint32_t *y2, uint32_t *pwmf); 
void gen_tf(uint32_t *psis, uint32_t *inv_psis);
void gen_pwmf(uint32_t *pwmf);

#endif