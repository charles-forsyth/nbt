#!/bin/bash -l

cp /opt/repo/blast/blast/* .

~/ncbi-blast-2.10.1+/bin/makeblastdb -in mouse.1.protein.faa -dbtype prot
~/ncbi-blast-2.10.1+/bin/makeblastdb -in zebrafish.top.faa -dbtype prot

~/ncbi-blast-2.10.1+/bin/blastp -query zebrafish.top.faa -db mouse.1.protein.faa -out zebrafish.x.mouse
