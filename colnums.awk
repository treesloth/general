#! /usr/bin/awk -f

NR == 1 {
        for (i = 1 ; i <= NF ; i++)
                {
                print i "\t" $i
                }
        }
NR > 1  {
        exit
        }
