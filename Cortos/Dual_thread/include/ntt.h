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

#include "utils.h"

void ct_ntt(uint16_t *a, uint16_t *psis);
void ntt_256(uint16_t *x, uint16_t *psis);
void ntt_thread(void* args);
void ntt_top(uint16_t *x, uint16_t *psis);



#endif