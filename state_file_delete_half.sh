#! /bin/bash

delete=1
rename=1

if [ -f "HALVED.txt" ]; then
    echo "Not deleting statefiles, it has already been done!"
    echo "If you really want to delete statefiles, remove HALVED.txt."
    delete=0
    rename=0
fi

for file in $(ls state????.cdf.dat); do
    number=${file//[^0-9]/}
    if [ $((10#$number%2)) == 1 ]; then
        echo $number " is odd, removing"
        if [ $delete == 1 ]; then
            rm $file
        fi
    fi
done

for file in $(ls state????.cdf.dat); do
    number=${file//[^0-9]/}
    half=$((10#$number/2))
    echo $half
    if [ $half -lt 10 ]; then
        num=000$half
    elif [ $half -lt 100 ]; then
        num=00$half
    elif [ $half -lt 1000 ]; then
        num=0$half
    else
        num=$half
    fi
    filename=state${num}.cdf.dat
    echo "file:" $file " -> " $filename
    if [ $rename == 1 ]; then
        mv $file $filename
    fi
done

echo "This folder has had half the statefiles removed." >> HALVED.txt
