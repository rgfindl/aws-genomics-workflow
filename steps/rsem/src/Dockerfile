FROM gcc:5

ENV VERSION="1.3.0"

# Metadata
LABEL container.base.image="gcc:5"
LABEL software.name="rsem"
LABEL software.version=${VERSION}
LABEL software.description=""
LABEL software.website=""
LABEL software.documentation=""
LABEL software.license=""
LABEL tags="Genomics"

# Application installation
RUN wget https://github.com/deweylab/RSEM/archive/v${VERSION}.tar.gz && \
    tar -xzf v${VERSION}.tar.gz && rm v${VERSION}.tar.gz

WORKDIR RSEM-${VERSION}

RUN make

RUN make install

CMD ls

#docker build -t snpeff .
#docker run -v ${PWD}/../../.test-data/:/data -e INPUT="snpeff-input.vcf" snpeff