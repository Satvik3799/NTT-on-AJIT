This branch is for comparing NTT running on single thread and two threads.

NTT of input array is computed and then INTT of the same array is computed to get the same input message, which is verified by checking if all 256 elements are same or not. 

Logs from the AJIT C Simulation:

[INFO]           :           Twiddle factors generated.
[RESULT]         :           PSIS array:           1  1729  2580  3289  2642  
[RESULT]         :           INV_PSIS array:           1 1600 40 749 2481 
[INFO]           :           measure on single thread.
[INFO]           :           Input of NTT:           0  1  2  3  4  
[RESULT]         :           Single thread NTT Times: 3245089.000000
[RESULT]         :           Single-thread NTT:           2429  425  1865  624  2483  
[RESULT]         :           Single thread INTT Times: 1869486.000000
[RESULT]         :           Single-thread INTT:           0  1  2  3  4  
[RESULT]         :           Single thread Verify:
1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  
[INFO]           :           Dual-thread NTT measure on two threads starts here.
[RESULT]         :           Dual-thread NTT Times: 1479270.000000
[RESULT]         :           Result of Dual-thread NTT:           2429  425  1865  624  2483  
[INFO]           :           Input of Dual-thread INTT:           2429  425  1865  624  2483  
[RESULT]         :           Dual-thread INTT Times: 1399926.000000
[RESULT]         :           Result of Dual-thread INTT           0  1  2  3  4  
[RESULT]         :           Dual-thread Verify:
1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  
------------------------------------------------------
[RESULT]         :           NTT Speed up = 2.193710
------------------------------------------------------
------------------------------------------------------
[RESULT]         :           INTT Speed up = 1.335418
------------------------------------------------------
[INFO]           :           close the channel..
