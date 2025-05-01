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


// Define necessary constants
#define q 3329
#define n2 256
#define n 128
#define inv_n 3303
#define psin 17
#define inv_psin 1175
#define k 2

void set_NTT_Args(thread_args *args, uint16_t *x, uint16_t *psis)
{
	args->x = x;
	args->psis = psis;
}

// //To track progress
// #define total_steps 50 
// uint8_t progress_step = 0;
// void print_progress() {
//     progress_step++;
//     cortos_printf(".");
//     if (progress_step == total_steps) {
//         cortos_printf("100%%\n");
//     }
// }


// Function to print a 1D array
// void print_1d_array(uint16_t arr[], uint16_t size) {
//     uint16_t i;
//     for ( i = 0; i < size; i++) {
//         cortos_printf("%d ", arr[i]);
//     }
//     cortos_printf("\n");
// }

// Function to print a 2D array with row and column indices
// void print2DArray(uint16_t arr[2][256], int rows, int cols) {
//     uint16_t i, j;
//     for ( i = 0; i < rows; i++) {
//         cortos_printf("arr[%d]: { ", i);
//         for ( j = 0; j < cols; j++) {
//             cortos_printf("%d ", arr[i][j]);
//         }
//         cortos_printf("}\n"); // Newline after each row
//     }
// }


uint16_t bit_reverse(uint16_t num, uint16_t logn) {
    uint16_t rev_num = 0;
    uint16_t i;
    for (i = 0; i < logn; i++) {
        if ((num >> i) & 1) {
            rev_num |= 1 << (logn - 1 - i);
        }
    }////print_progress();
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
    }////print_progress();
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
    uint16_t v1 = barret_reduction((uint64_t)w * v % q); ////print_progress();
    *x = (u + v1) % q;
    *y = (u - v1 + q) % q;
}

void butterfly_dif(uint16_t w, uint16_t u, uint16_t v, uint16_t *x, uint16_t *y) {
    *x = (u + v) % q;
    uint16_t y1 = (u - v + q) % q;
    *y = barret_reduction((uint16_t)w * y1 % q); ////print_progress();
}


//Output is y3 and y1, y2, pwmf are input arrays
void point_wise_mult(uint16_t *y3, uint16_t *y1, uint16_t *y2, uint16_t *pwmf) {
    uint16_t y1e[n], y1o[n], y2e[n], y2o[n], y3e[n], y3o[n];
    uint16_t i;

    // Print the input arrays
    // cortos_printf("Input array y1:\n");
    // for (uint16_t i = 0; i < 256; i++) {
    //     cortos_printf("%u ", y1[i]);
    // }
    // cortos_printf("\n\nInput array y2:\n");
    // for (uint16_t i = 0; i < 256; i++) {
    //     cortos_printf("%u ", y2[i]);
    // }
    // cortos_printf("\n\nInput array pwmf:\n");
    // for (uint16_t i = 0; i < 128; i++) {
    //     cortos_printf("%u ", pwmf[i]);
    // }
    // cortos_printf("\n");
    
    for ( i = 0; i < n; i++) {
        y1e[i] = y1[i];
        y1o[i] = y1[i + n];
        y2e[i] = y2[i];
        y2o[i] = y2[i + n];
    }; ////print_progress();
    for ( i = 0; i < n; i++) {
        y3e[i] = ((uint32_t)y1e[i] * y2e[i] % q + (uint32_t)y1o[i] * y2o[i] % q * pwmf[i] % q) % q;
        y3o[i] = ((uint32_t)y1e[i] * y2o[i] % q + (uint32_t)y1o[i] * y2e[i] % q) % q;
    }; //print_progress();
    for ( i = 0; i < n; i++) {
        y3[i] = y3e[i];
        y3[i + n] = y3o[i];
    }; //print_progress();

    // // Print the result
    // cortos_printf("Result of point_wise_mult function:\n");
    // for (uint16_t i = 0; i < 256; i++) {
    //     cortos_printf("%u ", y3[i]);
    // }
    // cortos_printf("\n");

};



//QC - Passed
void gen_tf(uint16_t *psis, uint16_t *inv_psis) {
    uint16_t logn = (uint16_t)log2(n);
    uint16_t tmp1[n], tmp2[n], positions[n];
    uint16_t x;
    for ( x = 0; x < n; x++) {
        positions[x] = bit_reverse(x, logn);
    }; ////print_progress();

    uint16_t psi = 1, inv_psi = 1;
    for ( x = 0; x < n; x++) {
        tmp1[x] = psi;
        tmp2[x] = inv_psi;
        psi = (uint64_t)psi * psin % q;
        inv_psi = (uint64_t)inv_psi * inv_psin % q;
    }; ////print_progress();

    for ( x = 0; x < n; x++) {
        psis[x] = tmp1[positions[x]];
        inv_psis[x] = tmp2[positions[x]];
    }; ////print_progress();

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

};


void gen_pwmf(uint16_t *pwmf) {
    uint16_t logn = (uint16_t)log2(n);
    uint16_t i;
    for ( i = 0; i < n; i++) {
        uint16_t exponent = 2 * bit_reverse(i, logn) + 1;
        uint32_t val = 1;
        uint16_t base = psin;

        // Compute psin^exponent % q using an iterative approach
        while (exponent > 0) {
            if (exponent % 2 == 1) {
                val = (val * base) % q;
            }
            base = (base * base) % q;
            exponent /= 2;
        } ////print_progress();

        pwmf[i] = val;
    } ////print_progress();
    
    // Print the PWMF array
    // cortos_printf(" Inside Function, PWMF array:\n");
    // for (uint16_t i = 0; i < n; i++) {
    //     cortos_printf("%u ", pwmf[i]);
    // }
    // cortos_printf("\n");
}

