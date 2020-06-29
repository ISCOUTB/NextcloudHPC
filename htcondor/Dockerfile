FROM centos:centos7

LABEL maintainer="Angel Jimenez <ajimenez@digitalcaribe.com.co>"

ARG SUBMIT_USER=www-data
ARG GID=1000
ARG UID=1000
ARG PASS=123456
# Build in one RUN
RUN yum -y install \
         yum-utils \
         sudo \
         which \
         openssh-clients && \
    yum -y groupinstall 'Development Tools'
RUN yum -y install wget
RUN wget https://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor && \
    rpm --import RPM-GPG-KEY-HTCondor && \
    yum-config-manager --add-repo https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-development-rhel7.repo && \
    yum -y install condor-bosco && \
    yum clean all && \
    rm -f RPM-GPG-KEY-HTCondor && \
    groupadd -g ${GID} ${SUBMIT_USER} && \
    useradd -m -u ${UID} -g ${GID} ${SUBMIT_USER} && \
    usermod -a -G condor ${SUBMIT_USER} && \
    echo ${PASS} | passwd --stdin ${SUBMIT_USER} && \
    mkdir /home/${SUBMIT_USER}/example && \
    sed -i 's/\(^Defaults.*requiretty.*\)/#\1/' /etc/sudoers && \
    rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime

# KNOBS and startup script
COPY condor_config.docker_image /etc/condor/config.d/
COPY start-condor.sh /usr/sbin/

# Signal to User of this image use this directory (run with -v)
VOLUME ["/home/${SUBMIT_USER}/submit"]
WORKDIR /home/${SUBMIT_USER}/submit

# Copy in an example HTCondor submission and fix permissions
COPY hello.s* /home/${SUBMIT_USER}/example/
RUN chown -R ${SUBMIT_USER}:${SUBMIT_USER} /home/${SUBMIT_USER}/example

RUN yum update -y

RUN mkdir /home/nextcloud
RUN chmod -R 777 /home/nextcloud/

RUN yum install nano -y

COPY recibe.py /home/${SUBMIT_USER}/

RUN yum update -y \
    yum install cronie -y

RUN yum update -y \
    && yum install -y https://centos7.iuscommunity.org/ius-release.rpm \
    && yum install -y python36u python36u-libs python36u-devel python36u-pip \
    && yum install -y which gcc \
    && yum install -y openldap-devel

RUN pip3.6 install pipenv
RUN ln -s /usr/bin/pip3.6 /bin/pip
RUN rm /usr/bin/python
# python must be pointing to python3.6
RUN ln -s /usr/bin/python3.6 /usr/bin/python
RUN python -m pip install pika --upgrade

# Use this if you're not going to restart HTCondor in the container.
# If you do need to do that, you're better off running the condor_master
# command manually
CMD ["/usr/sbin/start-condor.sh"]