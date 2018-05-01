#!/bin/bash
for flag in O0 O1 O2 O3
do
   echo $flag
   gcc -Wall -g -$flag -o matadd 2matadd.s matadd-driver.o
   for i in 1 2 3 4 
   do
      perf stat --output rec ./matadd &> myout
      awk '/cycles/ {print}' rec
      awk '/instructions/ {print}' rec
      awk '/misses/ {print}' rec
      awk '/seconds/ {print}' rec
      awk '/task-clock/ {print}' rec
      echo     ~~~~~~~~~~~~~~~~~~~
   done
   echo *~*~*~*~*~*~*~*~*~*~*~*~*~*

done
