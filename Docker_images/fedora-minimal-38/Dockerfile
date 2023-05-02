FROM registry.fedoraproject.org/fedora-minimal:38

# Install necessary packages
RUN microdnf install -y rsyslog systemd  langpacks-en glibc-locale-source glibc-langpack-en gcc unzip wget ansible && \
    microdnf clean all

# Comment out the "$ModLoad imklog" line in rsyslog.conf
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

# Set the UTF-8 locale environment variables
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Install Ansible inventory file
RUN microdnf install -y ansible &&  mkdir -p /etc/ansible && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Remove unnecessary getty and udev targets
RUN rm -f /usr/lib/systemd/system/multi-user.target.wants/* \
  /etc/systemd/system/*.wants/* \
  /usr/lib/systemd/system/local-fs.target.wants/* \
  /usr/lib/systemd/system/sockets.target.wants/*udev* \
  /usr/lib/systemd/system/sockets.target.wants/*initctl* \
  /usr/lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
  /usr/lib/systemd/system/systemd-update-utmp* \
  /usr/lib/systemd/system/getty.target

# Set the default command to launch systemd
CMD ["/usr/lib/systemd/systemd", "log-level=info", "unit=sysinit.target"]

