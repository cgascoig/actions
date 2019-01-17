FROM python:3.6-stretch
ENTRYPOINT [ "/entrypoint.sh" ]

RUN pip3 install ansible-runner ansible requests pycryptodome

ADD https://github.com/CiscoUcs/intersight-ansible/archive/master.tar.gz /tmp/intersight-ansible.tar.gz

WORKDIR /runner
RUN (cd /tmp; tar xvfz /tmp/intersight-ansible.tar.gz; mkdir -p /runner/project; cp -r intersight-ansible-master/* /runner/project ; rm -Rf /tmp/intersight-ansible*; )

ADD entrypoint.sh /entrypoint.sh