# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "chaifeng/ubuntu-22.04-docker-23.0.6#{(`uname -m`.strip == "arm64")?"-arm64":""}"
  config.vm.provision "shell", inline: <<-SHELL
    set -xeuo pipefail
    docker top some-postgres || docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
    cd /vagrant
    docker build --tag chaifeng/pgcli:test ./
    docker run --rm --link some-postgres:postgres --env PGPASSWORD=mysecretpassword pgcli -h postgres -U postgres --list
  SHELL
end
