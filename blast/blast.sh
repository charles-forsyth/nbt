#!/bin/bash -l

cd /opt/repo/blast

makeblastdb -in mouse.1.protein.faa -dbtype prot
makeblastdb -in zebrafish.top.faa -dbtype prot

blastp -query zebrafish.top.faa -db mouse.1.protein.faa -out zebrafish.x.mouse
