FROM centos:7

RUN \
  yum install -y \
    epel-release \
    gcc \
    openssl \
    openssl-devel \
    libffi \
    libffi-devel \
    curl \
    openssh-clients \
    python \
    py-pip \
    py-setuptools \
    python-devel \
    tar && \
  curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
  python get-pip.py && \
  pip install paramiko && \
  pip install pyyaml && \
  pip install Jinja2 && \
  pip install boto && \
  pip install python-dateutil && \
  pip install httplib2 && \
  pip install pycrypto

RUN mkdir /etc/ansible/ /ansible
RUN echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

RUN \
  curl -fsSL https://github.com/ansible/ansible/releases/download/v2.0.0.1-1/ansible-2.0.0.1.tar.gz -o ansible.tar.gz && \
  tar -xzf ansible.tar.gz -C ansible --strip-components 1 && \
  rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

RUN mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PATH /ansible/bin:$PATH
ENV PYTHONPATH /ansible/lib

ENTRYPOINT ["ansible-playbook","-e","require_sudo=False"]
