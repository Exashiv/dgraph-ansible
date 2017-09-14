VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.ssh.insert_key = false

  config.vm.define "node1"
  config.vm.define "node2"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.host_vars = {
      "node1" => {"http_port" => 80,
                  "maxRequestsPerChild" => 808},
      "node2" => {"http_port" => 303,
                  "maxRequestsPerChild" => 909}
    }
    ansible.sudo = true
  end
end