#! /usr/bin/gawk -f

## Output in a nice format:
## count,min,max,sum,mean,stddev,pop_stddev

BEGIN   {
        OFS = ","
        }

#       Main section...
#       The count is simply NR
        {
        if ( min !~ "[0-9]" )
                {
                min = $1
                }

        if ( $1 < min )
                {
                min = $1
                }

        if ( $1 >= max )
                {
                max = $1
                }

        sum += $1
        delta = $1 - mean
        mean += delta / NR
        meansqr += delta * ( $1 - mean )
        }

END     {
        std_dev = sqrt( meansqr / NR )
        if ( NR > 1 )
                {
                pstd_dev = sqrt( meansqr / ( NR - 1 ) )
                }
        else
                {
                pstd_dev = 0
                }

        print "COUNT:\t" FNR
        print "MIN:\t" min
        print "MAX:\t" max
        if ( sum != "no" )
                {
                print "SUM:\t" sum
		fsum = sprintf("%'d", sum)
		print "fSUM:\t" fsum
                }
	fmean = sprintf("%d", mean)
	fstd_dev = sprintf("%d", std_dev)
        print "MEAN:\t" fmean
        print "STDDEV:\t" fstd_dev
        }

