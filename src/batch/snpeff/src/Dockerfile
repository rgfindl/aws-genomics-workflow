FROM openjdk:8-jre

ENV VERSION="4.3p"
ENV UNDERSCORE_VERSION="4_3p"

# Metadata
LABEL container.base.image="openjdk:8-jre"
LABEL software.name="snpeff"
LABEL software.version=${VERSION}
LABEL software.description=""
LABEL software.website=""
LABEL software.documentation=""
LABEL software.license=""
LABEL tags="Genomics"

# Application installation
RUN wget -O /snpeff.zip https://downloads.sourceforge.net/project/snpeff/snpEff_v${UNDERSCORE_VERSION}_core.zip && \
    unzip /snpeff.zip && rm /snpeff.zip

RUN java -jar /snpEff/snpEff.jar download hg38

ADD run.sh ./run.sh
RUN chmod a+x ./run.sh

CMD ./run.sh

#docker build -t snpeff .
#docker run -v ${PWD}/../../.test-data/:/data -e INPUT="snpeff-input.vcf" snpeff