FROM openjdk:8-jre

ENV VERSION="0.36"

# Metadata
LABEL container.base.image="openjdk:8-jdk"
LABEL software.name="trimmomatic"
LABEL software.version=${VERSION}
LABEL software.description=""
LABEL software.website=""
LABEL software.documentation=""
LABEL software.license=""
LABEL tags="Genomics"

# Application installation
RUN wget -O /trimmomatic.zip http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-${VERSION}.zip && \
    unzip /trimmomatic.zip && rm /trimmomatic.zip

CMD java -jar Trimmomatic-${VERSION}/trimmomatic-${VERSION}.jar SE -phred33 /data/${INPUT} /data/trimmomatic-out.fq.gz ILLUMINACLIP:Trimmomatic-${VERSION}/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

#docker build -t trimmomatic .
#docker run -v ${PWD}/../../.test-data/:/data -e INPUT="NA12878-Rep1_S7_L004_R2_001.fastq.gz" trimmomatic