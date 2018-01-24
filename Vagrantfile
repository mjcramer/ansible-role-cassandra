
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Base VM OS configuration.
  config.vm.box = "centos/7"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.hostname = "cassandra"

  config.vm.provision :shell do |shell|
    shell.inline = "sudo yum install -y epel-release; sudo yum update -y"
  end

  N = 2
  (1..N).each do |machine_id|
    config.vm.define "cassandra-#{machine_id}" do |machine|
      machine.vm.hostname = "consul-#{machine_id}"
      machine.vm.network :private_network, ip: "192.168.23.#{10+machine_id}"

      # Virtualbox configuration
      config.vm.provider :virtualbox do |virtualbox|
        virtualbox.name = "cassandra-#{machine_id}"
        virtualbox.customize ['modifyvm', :id, '--memory', '2048']
        virtualbox.customize ['modifyvm', :id, '--ioapic', 'on']
        virtualbox.customize ['modifyvm', :id, '--cpus', '2']
        virtualbox.customize ['modifyvm', :id, '--cpuexecutioncap', '50']
        virtualbox.customize ['modifyvm', :id, '--groups', '/cassandra']
      end

      if machine_id == 1
        machine.vm.network :forwarded_port, id: 'cassandra', guest: 8500, host: 8500
      end

      # Only execute once the Ansible provisioner,
      # when all the machines are up and ready.
      if machine_id == N
        machine.vm.provision :ansible do |ansible|
          # Disable default limit to connect to all the machines
          ansible.limit = "all"
          ansible.playbook = "tests/test.yml"
          ansible.groups = {
              'cassandra_hosts' => (1..N).map { |element| "cassandra-#{element}" }
          }
          ansible.extra_vars = {
              cluster_interface: 'eth1',
              cassandra_seed_nodes: '192.168.23.11,192.168.23.12'
          }
        end
      end
    end
  end

end
