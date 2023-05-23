#!/bin/bash

eval $(spack load --sh bedtools2@2.30)

echo -e "chip_peak_id\tnearby_BCOR_peak_id"
bedtools window -a ./CRX.chip_peaks.mm9.bed -b $1 -w 100 | awk '{ print $4 "\t" $8 }'
