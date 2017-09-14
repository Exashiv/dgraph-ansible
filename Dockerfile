FROM ansible/ubuntu14.04-ansible:stable
# or, for example, FROM ansible/ubuntu14.04-ansible:stable

# Add playbooks to the Docker image
ADD ansible /srv/example/
WORKDIR /srv/example

RUN apt-get install -y curl libcurl3; exit 0

# Run Ansible to configure the Docker image
RUN ansible-playbook site.yml -c local

# Other Dockerfile directives are still valid
EXPOSE 22 3000 80
ENTRYPOINT ["cd","/usr/local/bin"]