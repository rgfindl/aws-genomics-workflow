FROM gcc:5

ENV VERSION="2.5.4b"

# Metadata
LABEL container.base.image="gcc:5"
LABEL software.name="star"
LABEL software.version=${VERSION}
LABEL software.description=""
LABEL software.website=""
LABEL software.documentation=""
LABEL software.license=""
LABEL tags="Genomics"

# Application installation
RUN wget https://github.com/alexdobin/STAR/archive/${VERSION}.tar.gz && \
    tar -xzf ${VERSION}.tar.gz && rm ${VERSION}.tar.gz
RUN ls

WORKDIR STAR-${VERSION}/source
RUN ls

RUN make STAR

ADD run.sh ./run.sh
RUN chmod a+x ./run.sh

CMD ./run.sh

CMD ./STAR -version

#docker build -t star .
#docker run -v ${PWD}/../../.test-data/:/data -e INPUT="snpeff-input.vcf" star