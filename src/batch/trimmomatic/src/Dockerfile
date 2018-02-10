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

ADD run.sh ./run.sh
RUN chmod a+x ./run.sh

CMD ./run.sh

#docker build -t trimmomatic .
#docker run -v ${PWD}/../../.test-data/:/data -e INPUT="NA12878-Rep1_S7_L004_R2_001.fastq.gz" trimmomatic