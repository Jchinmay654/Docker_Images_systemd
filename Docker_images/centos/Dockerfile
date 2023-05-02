# Use the official CentOS base image
FROM centos:latest

RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y


# Copy the repository configuration files
COPY CentOS-AppStream.repo /etc/yum.repos.d/CentOS-AppStream.repo
COPY CentOS-BaseOS.repo /etc/yum.repos.d/CentOS-BaseOS.repo

# Update the system and install necessary packages
RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y rsyslog systemd python3-pip glibc-langpack-en gcc unzip wget openssl-devel libffi-devel cargo && \
    yum clean all

# Comment out the "$ModLoad imklog" line in rsyslog.conf
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

# Set the UTF-8 locale environment variables
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Upgrade pip
RUN pip3 install --upgrade pip

# Install Ansible via Pip
RUN pip3 install --no-cache-dir ansible

# Install Ansible inventory file
RUN mkdir -p /etc/ansible && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Remove unnecessary getty and udev targets
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp* \
    /lib/systemd/system/getty.target

