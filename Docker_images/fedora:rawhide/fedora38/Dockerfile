FROM fedora:38

# Update the system and install necessary packages
RUN dnf update -y \
   &&  dnf install -y rsyslog systemd python3-pip langpacks-en glibc-locale-source glibc-langpack-en gcc unzip wget python3-setuptools \
    && dnf clean all
    

# Comment out the "$ModLoad imklog" line in rsyslog.conf
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

# Set the UTF-8 locale environment variables
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Install Ansible via Pip
RUN dnf install ansible

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

# Set the default command to launch systemd
CMD [ "/lib/systemd/systemd", "log-level=info", "unit=sysinit.target"]
