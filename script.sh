#!/bin/bash

if ! command -v ssh &> /dev/null
	then
		echo "you do not appear to have openssh please install it"
		exit
fi
read -p "Enter the host address for ansible please: " HOST
STATUS="$(systemctl is-active -q ssh)"
if [ !("${STATUS}" = "active") ]; then
	systemctl start sshd
	systemctl enable sshd
fi	
useradd -m devops
passwd devops
ssh-copy-id devops@$HOST
echo 'devops ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
ansible-playbook -i $HOST install_vim.yaml
