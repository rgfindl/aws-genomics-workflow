#!/bin/bash

#java -jar Trimmomatic-${VERSION}/trimmomatic-${VERSION}.jar SE -phred33 /data/${INPUT} /data/trimmomatic-out.fq.gz ILLUMINACLIP:Trimmomatic-${VERSION}/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36


printf "trimmomatic\n"