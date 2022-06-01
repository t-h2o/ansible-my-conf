# My laptop

To deploy my setup and program, I use ansible.

## Setup your remote machine

1. Check if you have openssh
   this command should give you an output
	```sh
		command -v ssh
	```

2. Start sshd

   ```sh
   systemctl start sshd
   systemctl enable sshd
   ```

3. Create devops user

   ```sh
   useradd -m devops
   passwd devops
   ```

4. Copy ssh key

   ```sh
   ssh-copy-id devops@host
   ```

5. Remove sudo password for `devops`
   in `/etc/sudoers` run this command

   ```sh
   echo 'devops  ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
   ```

## Install vim

```sh
ansible-playbook -i hosts install_vim.yaml
```
