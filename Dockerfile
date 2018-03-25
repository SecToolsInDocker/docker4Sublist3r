FROM alpine:3.7
LABEL maintainer "nancheald@gmail.com"
# install common tools
RUN apk update \
    && apk add git \
    && apk add python \
    && apk add py2-pip
# download Sublist3r from github
RUN git clone https://github.com/aboul3la/Sublist3r sublist3r
WORKDIR sublist3r
RUN pip install -r requirements.txt \
    && pip install pysocks
ENTRYPOINT ["/usr/bin/python", "/sublist3r/sublist3r.py"]