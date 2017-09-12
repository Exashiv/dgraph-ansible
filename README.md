# Setup Dgraph via Ansibble

These playbooks deploy a simple configuration for dgraph.
Edit `hosts` inventory file to include the names or URLs of the servers you want to deploy. 

Then run the playbook, like this:

	ansible-playbook -i hosts site.yml

The playbooks will configure Dgraph with configuration setup. When the run is complete, you can hit access th dgraph.