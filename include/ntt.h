#ifndef NTT_H
#define NTT_H

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

void ct_ntt(uint32_t *a, uint32_t *psis);
void ntt_256(uint32_t *x, uint32_t *psis);
void ntt_thread(void* args);
void ntt_top(uint32_t *x, uint32_t *psis);



#endif