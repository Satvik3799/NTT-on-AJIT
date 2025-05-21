#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#include <cortos.h>
#include <thread_channel.h>
#include <ajit_access_routines.h>

//satvik headers
#include "ntt.h"
#include "intt.h"
#include "utils.h"

// Define necessary constants
#define q 3329
#define n2 256
#define n 128
#define inv_n 3303
#define psin 17
#define inv_psin 1175

const uint32_t input[n2] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
    30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
    40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
    50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
    60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
    70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
    80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
    90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
    100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
    110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
    120, 121, 122, 123, 124, 125, 126, 127, 128, 129,
    130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
    140, 141, 142, 143, 144, 145, 146, 147, 148, 149,
    150, 151, 152, 153, 154, 155, 156, 157, 158, 159,
    160, 161, 162, 163, 164, 165, 166, 167, 168, 169,
    170, 171, 172, 173, 174, 175, 176, 177, 178, 179,
    180, 181, 182, 183, 184, 185, 186, 187, 188, 189,
    190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
    200, 201, 202, 203, 204, 205, 206, 207, 208, 209,
    210, 211, 212, 213, 214, 215, 216, 217, 218, 219,
    220, 221, 222, 223, 224, 225, 226, 227, 228, 229,
    230, 231, 232, 233, 234, 235, 236, 237, 238, 239,
    240, 241, 242, 243, 244, 245, 246, 247, 248, 249,
    250, 251, 252, 253, 254, 255
};

volatile ThreadChannel volatile tc;

void setup()
{
	__ajit_serial_configure__(1,0,0);
	__ajit_serial_set_baudrate__ (115200, 80000000);
	__ajit_serial_set_uart_reset__ (0);

	cortos_printf("Init channel.\n");
	// initialize scoreboard.
	initChannel(&tc, 1);

}

uint32_t main_00()
{

    uint32_t i,j;
    uint32_t verify[n2];    
    uint32_t psis[n], inv_psis[n];
    uint32_t x_single[n2], x_dual[n2];  //Input arrays inside the main function

    gen_tf(psis, inv_psis);
    cortos_printf("[INFO]           :           Twiddle factors generated.\n");

     // Print the PSIS array
    cortos_printf("[RESULT]         :           PSIS array:           ");
    for (i = 0; i < 5; i++) {
        cortos_printf("%d  ", psis[i]);
    }
    cortos_printf("\n");
    

    // Print the INV_PSIS array
    cortos_printf("[RESULT]         :           INV_PSIS array:           ");
    for (i = 0; i < 5; i++) {
        cortos_printf("%d ", inv_psis[i]);
    }
    cortos_printf("\n");
    
    cortos_printf("[INFO]           :           measure on single thread.\n");

    for(i=0; i < n2 ; i++) {
        x_single[i] = input[i];
    }

    cortos_printf("[INFO]           :           Input of NTT:           ");
    for(j = 0; j < 5; j++){
        cortos_printf("%d  ", x_single[j]);
    }
    cortos_printf("\n");
    
    

    uint64_t t00_0_ntt =__ajit_get_clock_time();
    // ntt_512(x_single, psis);
    ntt_256(x_single, psis);
    uint64_t t00_1_ntt = __ajit_get_clock_time();

    cortos_printf("[RESULT]         :           Single thread NTT Times: %f\n", (double) (t00_1_ntt - t00_0_ntt));
    
    cortos_printf("[RESULT]         :           Single-thread NTT:           ");
    for(j = 0; j < 5; j++){
        cortos_printf("%d  ", x_single[j]);
    }
    cortos_printf("\n");

    
    

    // uint32_t x_single_intt[n2] = {583, 2152, 1198, 863, 901, 1326, 3199, 3116, 2891, 1712, 265, 397, 657, 2613, 2718, 2438, 3167, 2609, 1640, 982, 533, 902, 1139, 1278, 2909, 1177, 920, 1138, 2543, 1134, 1752, 1197, 346, 2107, 2383, 1028, 360, 1757, 2310, 785, 1046, 2749, 2287, 1838, 1477, 576, 25, 1396, 2501, 1209, 2813, 124, 796, 1107, 1497, 700, 382, 677, 2197, 920, 1996, 1423, 187, 963, 3112, 1725, 380, 986, 288, 2567, 1861, 2772, 2983, 1064, 2678, 674, 1985, 1304, 1185, 2880, 1995, 1406, 2011, 101, 744, 164, 667, 805, 487, 1062, 1285, 1069, 1447, 1924, 1896, 930, 893, 2237, 3, 1184, 418, 770, 2613, 3289, 686, 2069, 2723, 19, 2783, 363, 110, 2466, 1207, 598, 901, 1366, 281, 426, 2136, 2216, 1780, 514, 985, 420, 1640, 2291, 1617, 1643, 2954, 1262, 3321, 1734, 2884, 1286, 1173, 1602, 3103, 1273, 2661, 2236, 2928, 2977, 2935, 3104, 1593, 1158, 2195, 908, 1376, 3009, 3148, 340, 936, 2977, 800, 1890, 872, 752, 1434, 542, 386, 2069, 1833, 1207, 2316, 2116, 71, 1049, 3092, 1977, 3120, 2079, 157, 778, 2340, 1240, 92, 3185, 1650, 2314, 504, 1917, 2197, 732, 743, 542, 769, 2285, 2548, 2504, 1252, 421, 1337, 729, 2415, 1488, 2231, 1301, 2185, 807, 2905, 3054, 2490, 2658, 765, 3008, 776, 3230, 2954, 220, 3188, 230, 1029, 803, 1906, 860, 788, 748, 1445, 1433, 1393, 2073, 1444, 2628, 2722, 2546, 2033, 978, 2259, 449, 1016, 751, 477, 1359, 746, 2836, 702, 141, 49, 479, 494, 3241, 3032, 2475, 634, 1856, 1007, 869, 3183, 813, 3085, 195, 2916, 1272, 2231, 1225};

    uint32_t x_single_intt[n2];
    for(i=0; i < n2 ; i++) {
        x_single_intt[i] = x_single[i];
    }

    // cortos_printf("[RESULT]         :           Input of Single-thread INTT:\n");
    // for(j = 0; j < n2; j++){
    //     cortos_printf("%d  ", x_single_intt[j]);
    // }
    // 
    // 

    uint64_t t00_0_intt =__ajit_get_clock_time();
    intt_256(x_single_intt, inv_psis);
    uint64_t t00_1_intt = __ajit_get_clock_time();

    cortos_printf("[RESULT]         :           Single thread INTT Times: %f\n", (double) (t00_1_intt - t00_0_intt));
    
    cortos_printf("[RESULT]         :           Single-thread INTT:           ");
    for(j = 0; j < 5; j++){
        cortos_printf("%d  ", x_single_intt[j]);
    }
    cortos_printf("\n");

    
    

    for (i=0; i < n2; i++) {
        if (x_single_intt[i] == input[i]) 
            verify[i] = 1; 
        else 
            verify[i] = 0;
    };

    cortos_printf("[RESULT]         :           Single thread Verify:\n");
    for(j = 0; j < n2; j++){
        cortos_printf("%d  ", verify[j]);
    }
    cortos_printf("\n");

    
    


    cortos_printf("[INFO]           :           Dual-thread NTT measure on two threads starts here.\n");

    for(i=0; i < n2 ; i++) {
        x_dual[i] = input[i];
    }

    uint64_t t0_ntt =__ajit_get_clock_time();
    ntt_top(x_dual, psis);
    uint64_t t1_ntt =__ajit_get_clock_time();

    cortos_printf("[RESULT]         :           Dual-thread NTT Times: %f\n", (double) (t1_ntt - t0_ntt));
    

    cortos_printf("[RESULT]         :           Result of Dual-thread NTT:           ");
    for(i = 0; i < 5; i++){
        cortos_printf("%d  ", x_dual[i]);
    }
    cortos_printf("\n");

    // uint32_t x_dual_intt[n2] = {583, 2152, 1198, 863, 901, 1326, 3199, 3116, 2891, 1712, 265, 397, 657, 2613, 2718, 2438, 3167, 2609, 1640, 982, 533, 902, 1139, 1278, 2909, 1177, 920, 1138, 2543, 1134, 1752, 1197, 346, 2107, 2383, 1028, 360, 1757, 2310, 785, 1046, 2749, 2287, 1838, 1477, 576, 25, 1396, 2501, 1209, 2813, 124, 796, 1107, 1497, 700, 382, 677, 2197, 920, 1996, 1423, 187, 963, 3112, 1725, 380, 986, 288, 2567, 1861, 2772, 2983, 1064, 2678, 674, 1985, 1304, 1185, 2880, 1995, 1406, 2011, 101, 744, 164, 667, 805, 487, 1062, 1285, 1069, 1447, 1924, 1896, 930, 893, 2237, 3, 1184, 418, 770, 2613, 3289, 686, 2069, 2723, 19, 2783, 363, 110, 2466, 1207, 598, 901, 1366, 281, 426, 2136, 2216, 1780, 514, 985, 420, 1640, 2291, 1617, 1643, 2954, 1262, 3321, 1734, 2884, 1286, 1173, 1602, 3103, 1273, 2661, 2236, 2928, 2977, 2935, 3104, 1593, 1158, 2195, 908, 1376, 3009, 3148, 340, 936, 2977, 800, 1890, 872, 752, 1434, 542, 386, 2069, 1833, 1207, 2316, 2116, 71, 1049, 3092, 1977, 3120, 2079, 157, 778, 2340, 1240, 92, 3185, 1650, 2314, 504, 1917, 2197, 732, 743, 542, 769, 2285, 2548, 2504, 1252, 421, 1337, 729, 2415, 1488, 2231, 1301, 2185, 807, 2905, 3054, 2490, 2658, 765, 3008, 776, 3230, 2954, 220, 3188, 230, 1029, 803, 1906, 860, 788, 748, 1445, 1433, 1393, 2073, 1444, 2628, 2722, 2546, 2033, 978, 2259, 449, 1016, 751, 477, 1359, 746, 2836, 702, 141, 49, 479, 494, 3241, 3032, 2475, 634, 1856, 1007, 869, 3183, 813, 3085, 195, 2916, 1272, 2231, 1225};
    uint32_t x_dual_intt[n2];
    
    for(i=0; i < n2 ; i++) {
        x_dual_intt[i] = x_dual[i];
    }


    cortos_printf("[INFO]           :           Input of Dual-thread INTT:           ");
    for(i = 0; i < 5; i++){
        cortos_printf("%d  ", x_dual[i]);
    }
    cortos_printf("\n");

    


    uint64_t t0_intt =__ajit_get_clock_time();
    intt_top(x_dual_intt, inv_psis);
    uint64_t t1_intt =__ajit_get_clock_time();

    cortos_printf("[RESULT]         :           Dual-thread INTT Times: %f\n", (double) (t1_intt - t0_intt));
    

    cortos_printf("[RESULT]         :           Result of Dual-thread INTT           ");
    for(i = 0; i < 5; i++){
        cortos_printf("%d  ", x_dual_intt[i]);
    }
    cortos_printf("\n");

    

    for (i=0; i < n2; i++) {
        if (x_dual_intt[i] == input[i]) 
            verify[i] = 1; 
        else 
            verify[i] = 0;
    };

    cortos_printf("[RESULT]         :           Dual-thread Verify:\n");
    for(j = 0; j < n2; j++){
        cortos_printf("%d  ", verify[j]);
    }
    cortos_printf("\n");

    cortos_printf("------------------------------------------------------\n");
    cortos_printf("[RESULT]         :           NTT Speed up = %f\n",((double)(t00_1_ntt - t00_0_ntt)) / ((double)(t1_ntt - t0_ntt)));
    cortos_printf("------------------------------------------------------\n");


    cortos_printf("------------------------------------------------------\n");
    cortos_printf("[RESULT]         :           INTT Speed up = %f\n",((double)(t00_1_intt - t00_0_intt)) / ((double)(t1_intt - t0_intt)));
    cortos_printf("------------------------------------------------------\n");

	cortos_printf("[INFO]           :           close the channel..\n");
	scheduleChannelJob(&tc, NULL, NULL);

	return(1);
}

uint32_t main_01 ()
{
	void (*__fn) (void*);
	void *__arg;

	// cortos_printf("------------------------------------------------------\n");
	cortos_printf("[INFO]           :           Entered main_01\n");
	// cortos_printf("------------------------------------------------------\n");

	while(1) 
	{
		while(getChannelJob(&tc, (void**) &__fn, (void**) &__arg))
		{
		}

		if(__fn != NULL)
		{
			(*__fn)(__arg);
			setChannelResponse(&tc, __arg);
		}
		else
			break;
	}

	return(1);

}

