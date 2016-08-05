FROM wscherphof/oracle-linux-7
#FROM centos:latest

RUN  yum install -y binutils.x86_64 compat-libcap1.x86_64 gcc.x86_64 gcc-c++.x86_64 glibc.i686 glibc.x86_64 \
     glibc-devel.i686 glibc-devel.x86_64 ksh compat-libstdc++-33 libaio.i686 libaio.x86_64 libaio-devel.i686 libaio-devel.x86_64 \
     libgcc.i686 libgcc.x86_64 libstdc++.i686 libstdc++.x86_64 libstdc++-devel.i686 libstdc++-devel.x86_64 libXi.i686 libXi.x86_64 \
     libXtst.i686 libXtst.x86_64 make.x86_64 sysstat.x86_64

# Install up-to-date epel rpm repository
#RUN yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install various packages to get compile environment
RUN yum -y groupinstall 'Development Tools'
RUN yum -y install sudo

# Install yum-utils to use yumdownloader command
RUN yum -y install -y yum-utils

RUN sed -i -e 's/Defaults    requiretty.*/ #Defaults    requiretty/g' /etc/sudoers

RUN echo -e  'y\n'| ssh-keygen -t rsa     -f /etc/ssh/ssh_host_rsa_key -N ''
RUN echo -e  'y\n'| ssh-keygen -t dsa     -f /etc/ssh/ssh_host_dsa_key -N '' 
RUN echo -e  'y\n'| ssh-keygen -t ecdsa   -f /etc/ssh/ssh_host_ecdsa_key -N ''

# create user - ubuntu - for ssh access and enable sudo operations
RUN groupadd -r ubuntu && \
    useradd -rmg ubuntu ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN su - ubuntu -c "mkdir ~/.ssh"
ADD files/ssh/authorized_keys /home/ubuntu/.ssh/authorized_keys
RUN chmod 0700 /home/ubuntu/.ssh

# Various options to make SSH access easier when testing Ansible playbooks
RUN \
  sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
  sed -i "s/StrictModes.*/StrictModes no/g" /etc/ssh/sshd_config && \
  touch /home/ubuntu/.Xauthority

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]

EXPOSE 22
