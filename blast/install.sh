#! /bin/bash -l


## Download and Install Software ##
wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.10.1/ncbi-blast-2.10.1+-x64-linux.tar.gz
tar -zxvf ncbi-blast-2.10.1+-x64-linux.tar.gz
cp ncbi-blast-2.10.1+/bin/* .

