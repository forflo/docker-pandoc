FROM ivotron/texlive:20160320-1
MAINTAINER Ivo Jimenez <ivo.jimenez@gmail.com>

RUN apt-get -yq update && apt-get install -y python-pip wget lmodern fonts-lmodern
RUN wget https://github.com/jgm/pandoc/releases/download/2.2.3.2/pandoc-2.2.3.2-1-amd64.deb && \
    dpkg -i pandoc-*-amd64.deb && \
    wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.2.1/linux-ghc84-pandoc22.tar.gz -q -O - | tar xz && \
    mv pandoc-crossref /usr/bin/ && \
    pip install pandocfilters && \
    apt-get clean -y && \
    rm -rf pandoc-*-amd64.deb /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENTRYPOINT ["pandoc"]
CMD ["--help"]
