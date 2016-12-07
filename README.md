# Chapter_4
Computer code required to prepare data for annotation by MG-RAST

Determine the median coverage of a contig: Required software to run code:
Bowtie2 (v2.0.0-beta6)
SAMTools (v1.2)
BEDTools (v2.24.0)
Python (v2.7.2)
numpy (v1.6.1)

bowtie2 -x sample_contigs_mapping -U sample_reads.fastq -S sample_mapping.sam -p 4

samtools view -b -S sample_mapping.sam -t sample _contigs.fa > sample _mapping.bam

samtools sort sample_mapping.bam sample_mapping.sorted

samtools index sample_mapping.sorted.bam

bamToBed -i sample_mapping.sorted.bam > sample_mapping.bed

python get_length.py sample_contigs.fa > sample_genome_len.txt

genomeCoverageBed -i sample_mapping.bed -d -g sample_genome_len.txt > sample_mapping.g-cov.bed

python get_coverage.py sample_JGI_mapping.g-cov.bed > sample_mapping.coverage.txt

python add_abund.py  sample_mapping.coverage.txt sample_contigs.fa > sample_contigs_abund.fa
