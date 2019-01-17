FROM python:3.6-alpine as base

FROM base as builder
RUN mkdir /install
WORKDIR /install

RUN apk add build-base python3-dev libffi-dev linux-headers openssl-dev

COPY requirements.txt /requirements.txt

RUN pip install --install-option="--prefix=/install" -r /requirements.txt

ADD https://github.com/CiscoUcs/intersight-ansible/archive/master.tar.gz /tmp/intersight-ansible.tar.gz
RUN (cd /tmp; tar xvfz /tmp/intersight-ansible.tar.gz; )

FROM base
ENTRYPOINT [ "/entrypoint.sh" ]

COPY --from=builder /install /usr/local

WORKDIR /runner
COPY --from=builder /tmp/intersight-ansible-master /runner/project

ADD entrypoint.sh /entrypoint.sh