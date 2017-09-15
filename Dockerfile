FROM ubuntu:14.04
MAINTAINER Surya Tresna <surya.tresna@gmail.com>

RUN echo "nameserver 10.164.4.31" > /etc/resolvconf/resolv.conf.d/base && echo "nameserver 10.164.4.32" >> /etc/resolvconf/resolv.conf.d/base && \
    resolvconf -u && \
    echo "" > /etc/resolv.conf && \
    echo "nameserver 10.164.4.31" >> /etc/resolv.conf && echo "nameserver 10.164.4.32" >> /etc/resolv.conf && \
    resolvconf -u && \
    apt-get update && \
    apt-get install -y curl libcurl3 && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts

# Add playbooks to the Docker image
ADD ansible /srv/example/
WORKDIR /srv/example

# Run Ansible to configure the Docker image
RUN ansible-playbook -i hosts site.yml

# Other Dockerfile directives are still valid
EXPOSE 22 3000 80