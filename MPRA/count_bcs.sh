#!/bin/bash
#SBATCH --job-name='count_bcs'
#SBATCH --array=1-52
#SBATCH --mem=512M
#SBATCH --time=00:10:00
#SBATCH --cpus-per-task=1
#SBATCH --output=%x.%J.%a.log
#SBATCH --mail-user=$USER@wustl.edu
#SBATCH --mail-type=FAIL

read genotype source_molecule library replicate sequencing_group < <(tail -n+2 sample_information.tsv | sed "${SLURM_ARRAY_TASK_ID}q;d")
sample_name="${genotype}.${library}.${source_molecule}.batch${sequencing_group}.rep${replicate}"

mkdir -p Barcodes

zcat SplitRawReads/${sample_name}.fastq.gz | rg --only-matching --replace '$BC' 'CATGC(?P<BC>[ATGC]{9})GCGGC' | python3 bc_count_helper.py <(tail -n+2 bc_to_library_id_map.tsv | cut -f1) > Barcodes/${sample_name}.barcode_counts.tsv
