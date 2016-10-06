FROM centos:7
MAINTAINER Thiago Figueiro thiago.figueiro@bt.com

RUN yum install -y make perl-Tk perl-Digest-MD5 python-pip wget
RUN mkdir /tmp/texlive && cd /tmp/texlive
RUN curl -Lo install-tl-unx.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar zxvf install-tl-unx.tar.gz --strip-components=1
ADD texlive.profile /tmp/
RUN ./install-tl -profile /tmp/texlive.profile -repository http://mirror.aut.ac.nz/CTAN/systems/texlive/tlnet
ENV PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH
RUN pip install Sphinx
