FROM ubuntu:14.04

# Metadata
LABEL container.base.image="ubuntu:14.04"
LABEL software.name="fusioncatcher"
LABEL software.version=${VERSION}
LABEL software.description=""
LABEL software.website=""
LABEL software.documentation=""
LABEL software.license=""
LABEL tags="Genomics"

RUN apt-get -y clean \
    && apt-get -y update \
    && apt-get -y install \
    automake \
    build-essential \
    bzip2 \
    cmake \
    curl \
    g++ \
    gawk \
    gcc \
    gzip  \
    libc6-dev \
    libncurses5-dev \
    libtbb2 \
    libtbb-dev \
    make \
    parallel \
    pigz \
    python \
    python-dev \
    python-biopython \
    python-numpy \
    python-openpyxl \
    python-xlrd \
    tar \
    unzip \
    wget \
    zip \
    zlib1g \
    zlib1g-dev \
    zlibc \
    default-jdk \
    && apt-get -y clean

WORKDIR /opt

######################
## INSTALLATION
######################

RUN wget --no-check-certificate http://sf.net/projects/fusioncatcher/files/bootstrap.py -O bootstrap.py \
    && python bootstrap.py -t --download -y -i /opt/fusioncatcher/v1.00/

#docker build -t trimmomatic .
#docker run -v ${PWD}/../../.test-data/:/data -e INPUT="NA12878-Rep1_S7_L004_R2_001.fastq.gz" trimmomatic