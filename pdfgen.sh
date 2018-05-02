#!/bin/bash
rm finalreport
UR=2
for UR in 1 2 4 8
do
for flag in O0 O1 O2 O3
do
   echo $flag
   rm rec$flag
   gcc -Wall -g -$flag -o matadd matadd$UR.s matadd-driver.o
   for i in 1  
   do
      perf stat -o rec$flag --append ./matadd &> myout
   done
done
rm report$UR
for flag in O0 O1 O2 O3
do
   cat rec$flag|tr -d , > rec2$flag
done
echo    "                         -O0            -O1            -O2            -O3" >> "report$UR"
echo  -n "cycles:      " >> "report$UR"
for flag in O0 O1 O2 O3
do
   awk  '/cycles:u/ {printf "%15d", $1 >> "'report$UR'"}' rec2$flag 
done

echo >> "report$UR"
echo -n "isntr:       " >> "report$UR"
for flag in O0 O1 O2 O3
do
   awk  '/instructions:u/ {printf "%15d", $1 >> "'report$UR'"}' rec2$flag 
done
echo >> "report$UR"
echo -n "misses:      " >> "report$UR"
for flag in O0 O1 O2 O3
do
   awk '/misses/ {printf "%15s", $1 >> "'report$UR'"}' rec2$flag 
done
echo >> "report$UR"
echo -n "% misses:    " >>"report$UR"
for flag in O0 O1 O2 O3
do
   awk '/misses/ {printf "%15s", $(NF-3) >> "'report$UR'"}' rec2$flag 
done

echo >> "report$UR"
echo -n "seconds:     " >> "report$UR"
for flag in O0 O1 O2 O3
do
   awk '/seconds/ {printf "%15s", $1 >> "'report$UR'"}' rec2$flag
done
echo >> "report$UR"
   #awk '/task-clock/ {print $1}' rec$flag
   echo ~~~~~~~~~~~~~~~~~~~ 
   echo *~*~*~*~*~*~*~*~*~*~*~*~*~*
echo "
Unroll: $UR" >> finalreport
cat report$UR >> finalreport

echo ####
done
gcc -O1 -pg  matadd.s matadd-driver.o
perf stat --output rec ./a.out &> myout
gprof ./matadd|less >> gprep
sed -n '3,8p' gprep >> finalreport

echo     ~~~~~~~~DONE~~~~~~~~~~~
for UR in 1 2 4 8
do
   for flag in O0 O1 O2 O3
   do
      rm rec$flag
      rm rec2$flag
   done
   rm report$UR
done
