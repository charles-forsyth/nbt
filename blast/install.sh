#! /bin/bash -l


## Download and Install Software ##
wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.10.1+-x64-linux.tar.gz 
tar -zxvf ncbi-blast-2.10.1+-x64-linux.tar.gz
cp ncbi-blast-2.10.1+/bin/* /usr/bin/.

## Copy job files to working directory ##
#cp /opt/repo/nbt/blast/* .
