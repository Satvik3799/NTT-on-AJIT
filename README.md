This branch is for comparing NTT running on single thread and two threads.

NTT of input array is computed and then INTT of the same array is computed to get the same input message, which is verified by checking if all 256 elements are same or not. 

Logs from the AJIT C Simulation are [here](https://github.com/Satvik3799/NTT-on-AJIT/blob/main/out_SW_256.txt)

------------------------------------------------------
[RESULT]         :           NTT Speed up = 2.193710
------------------------------------------------------
------------------------------------------------------
[RESULT]         :           INTT Speed up = 1.335418
------------------------------------------------------
