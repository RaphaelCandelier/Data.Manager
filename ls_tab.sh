#! /bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for file in $(ls)
do
    stat --printf="%A\t%h\t%U\t%G\t%s\t" $file
    mod_epoch=$(stat --format="%Y" $file)
    mod_month=$(date -d @$mod_epoch +"%b")
    mod_day=$(date -d @$mod_epoch +"%d")
    mod_time=$(date -d @$mod_epoch +"%H:%M")
    printf "%s\t%s\t%s\t%s\n" $mod_month $mod_day $mod_time $file
done
IFS=$SAVEIFS
