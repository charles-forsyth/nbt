#!/bin/bash -l

## Copy job files to working directory ##
cp /opt/repo/nbt/blast/* .


./makeblastdb -in mouse.1.protein.faa -dbtype prot
./makeblastdb -in zebrafish.1.protein.faa -dbtype prot

./blastp -query zebrafish.1.protein.faa -db mouse.1.protein.faa -num_threads 4 -out zebrafish.x.mouse
#./blastp -query zebrafish.top.faa -db mouse.1.protein.faa -num_threads 4 -out zebrafish.x.mouse

tar -zcvf job-output.tar.gz zebrafish.x.mouse
cp job-output.tar.gz /sharedvol/$(hostname)-job-output.tar.gz

