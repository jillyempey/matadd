#!/bin/bash
for flag in O0 O1 O2 O3
do
   echo $flag
   rm rec$flag
   gcc -Wall -g -$flag -o matadd 2matadd.s matadd-driver.o
   for i in 1  
   do
      perf stat -o rec$flag --append ./matadd &> myout
   done
done

echo "               -O0             -O1               -O2               -O3"
echo -n "cycles:    "
for flag in O0 O1 O2 O3
do
   awk '/cycles:u/ {printf "%15s", $1}' rec$flag
done

echo
echo -n instructions:
for flag in O1 O2 O3
do
   awk '/instructions:u/ {printf "%15s", $1}' rec$flag
done
   echo -n misses:
   awk '/misses/ {print $1,  $(NF-3)}' rec$flag
   echo -n seconds: 
   awk '/seconds/ {print $1}' rec$flag
   #awk '/task-clock/ {print $1}' rec$flag
   echo ~~~~~~~~~~~~~~~~~~~ 
   echo *~*~*~*~*~*~*~*~*~*~*~*~*~*


gcc -Wall -g -O1 -pg -o matadd 2matadd.s matadd-driver.o
perf stat --output rec ./matadd &> myout
awk '/cycles/ {print}' rec
awk '/instructions/ {print}' rec
awk '/misses/ {print}' rec
awk '/seconds/ {print}' rec
awk '/task-clock/ {print}' rec
echo     ~~~~~~~~~~~~~~~~~~~
gprof ./matadd|less > gpreport

