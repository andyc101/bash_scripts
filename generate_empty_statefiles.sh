#! /bin/bash
for i in `seq 1 100`; do
  if [ $i -lt 10 ]; then
    touch state000$i.cdf.dat
    echo $i > state000$i.cdf.dat
  elif [ $i -lt 100 ]; then
    touch "./state00$i.cdf.dat"
    echo $i > state00$i.cdf.dat
  elif [ $i -lt 1000 ]; then
    touch "./state0$i.cdf.dat"
    echo $i > state0$i.cdf.dat
  elif [ $i -lt 9999 ]; then
    touch "./state$i.cdf.dat"
    echo $i > state$i.cdf.dat
  fi
done
