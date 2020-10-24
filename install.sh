#! /bin/bash -l

wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/994/505/GCA_002994505.1_ASM299450v1/GCA_002994505.1_ASM299450v1_genomic.fna.gz &&
gunzip GCA_002994505.1_ASM299450v1_genomic.fna.gz &&
wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.10.1+-x64-linux.tar.gz &&
tar -zxvf ncbi-blast-2.10.1+-x64-linux.tar.gz &&
./ncbi-blast-2.10.1+/bin/makeblastdb -in GCA_002994505.1_ASM299450v1_genomic.fna -dbtype nucl -input_type fasta -out SerRivdb &&
ls /opt/repo/blast
#cp /opt/repo/blast/benedeniaGene.fasta . &&
#./ncbi-blast-2.10.1+/bin/tblastn -db SerRivdb -query benedeniaGene.fasta  -out blastout.txt
