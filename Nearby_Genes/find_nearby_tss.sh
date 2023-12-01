#!/bin/bash

eval $(spack load --sh bedtools2@2.30)

OUT="library_nearby_tss.tsv"

echo -e "chip_peak_id\tchip_peak_start\tchip_peak_stop\tnearby_ensembl_gene_id\tnearby_gene_name\tnearby_gene_tss" > $OUT
bedtools window -a library_positions_mm39.bed -b ensembl_GRCm39_protein_coding_tss.bed -w 100000 | awk '{ print $4 "\t" $2 "\t" $3 "\t" $8 "\t" $9 "\t" $6 }' >> $OUT
