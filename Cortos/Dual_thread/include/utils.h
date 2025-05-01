
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


volatile ThreadChannel volatile tc;

typedef struct thread_args{

    uint16_t *x;
    uint16_t *psis;

} thread_args;



void print_progress();
// void print_1d_array(uint16_t arr[], uint16_t size);
void set_NTT_Args(thread_args *args, uint16_t *x, uint16_t *psis);
uint16_t bit_reverse(uint16_t num, uint16_t logn);
uint16_t barret_reduction(uint16_t c1);
void addr_gen(uint16_t s, uint16_t i, uint16_t l, uint16_t v, uint16_t *ie_r, uint16_t *io_r, uint16_t *iw);
void butterfly_dit(uint16_t w, uint16_t u, uint16_t v, uint16_t *x, uint16_t *y);
void butterfly_dif(uint16_t w, uint16_t u, uint16_t v, uint16_t *x, uint16_t *y);
//Output is y3 and y1, y2, pwmf are input arrays
void point_wise_mult(uint16_t *y3, uint16_t *y1, uint16_t *y2, uint16_t *pwmf); 
void gen_tf(uint16_t *psis, uint16_t *inv_psis);
void gen_pwmf(uint16_t *pwmf);

#endif