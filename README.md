# Pandoc Docker Image

A docker image for running [Pandoc](http://pandoc.org). The image 
includes the following:

  * [latex](https://github.com/ivotron/docker-texlive)
  * [pandoc](https://github.com/jgm/pandoc)
  * [pandoc-citeproc](https://github.com/jgm/pandoc-citeproc)

Some images (see below for versioning info) also include the following 
packages:

  * [pandoc-crossref](https://github.com/jgm/pandoc-crossref)
  * [pandocfilters](https://github.com/jgm/pandocfilters)

## Usage

### Basic

```bash
docker run -v `pwd`/input.pd:/root/input.pd ivotron/pandoc <... options ...> /root/input.pd
```

### Advanced

This passes paths to specific latex files, bibliography style, bibtex 
file and pandoc templates

```bash
docker run \
  -v `pwd`/pandoc-templates:/root/.pandoc/templates \
  -v `pwd`/pandoc-filters/root/.pandoc/filters \
  -v `pwd`/latex-files:/root/texmf/tex/xelatex \
  -v `pwd`/bibtools/ieee.csl:/root/ieee.csl \
  -v `pwd`/bibfile/zotero.bib:/root/citations.bib \
  -v `pwd`/main.pdc:/root/main.pdc \
  -v `pwd`/out:/root/out \
  ivotron/pandoc:latest \
    --standalone \
    --latex-engine=xelatex \
    --self-contained \
    --csl=/root/ieee.csl \
    --bibliography=/root/citations.bib \
    --filter=/root/.pandoc/filters/foo.py \
    --reference-links \
    --metadata=acm-sig-alternate:'yes' \
    --output=/root/out/main.pdf /root/main.pdc
```

For more examples, checkout the 
[paper-template](https://github.com/ivotron/paper-template) 
repository.

## Version Info

### 2.2.3.2 (2.2.3.2, latest)

  * Ubuntu Xenial (`ubuntu:xenial`)
  * TexLive 20160320-1
  * pandoc 2.2.3.2
  * pandoc-crossref 0.3.2.1

### 1.19.2.1 (1.19.2.1)

  * Ubuntu Xenial (`ubuntu:xenial`)
  * TexLive 20160320-1
  * pandoc 1.19.2.1
  * pandoc-crossref 0.2.6.0

### 1.17 (1.17.1)

  * Ubuntu Xenial (`ubuntu:xenial`)
  * TexLive 20160320-1
  * pandoc 1.17.1
  * pandoc-citeproc 0.10
  * pandoc-crossref 0.2.1.3

### 1.17.0.2

  * Ubuntu Xenial (`ubuntu:xenial`)
  * TexLive 20160320-1
  * pandoc 1.17.0.2

### 1.16

  * Debian Jessie (debian:jessie)
  * TexLive 20141024-2
  * pandoc 1.16
  * pandoc-citeproc 0.9
  * pandoc-crossref 0.1.6.2

### 1.14.0.1

  * Debian Jessie (debian:jessie)
  * TexLive 20141024-2
  * pandoc 1.14.0.1
  * pandoc-citeproc 0.7.1.1
  * pandoc-crossref 0.1.2.0

### 1.13.2.1

  * Debian Jessie (debian:jessie)
  * TexLive 20141024-2
  * pandoc 1.13.2.1
  * pandoc-citeproc 0.7.1
  * pandoc-crossref 0.1.0.2

### 1.13.2

  * Ubuntu Trusty (stackbrew/ubuntu:14.04)
  * TexLive 2013.20140215-1
  * pandoc (1.13.2)
  * pandoc-citeproc (0.6)
  * pandoc-filters (1.2.3)

