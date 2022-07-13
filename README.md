# My laptop

To deploy my setup and program, I use ansible, there is a script automating the
following comands named script.sh.

## Goal

Deploy my [configuration](https://github.com/t-h2o/my-configuration) with ansible.

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
5. To remove sudo's password for `devops`
   in `/etc/sudoers` run this command
   ```sh
   echo 'devops  ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
   ```

## Ansible tree

An example of ansible tree:

```tree
.
├── group_vars
│   └── all
├── host_vars
│   └── laptop
├── roles
│   └── vim
├── playbook.yaml
└── hosts
```

### Hosts file

An example of a hosts file:

```yaml
---
# My laptops
mylaptops:
  hosts:
    laptop:
      ansible_host: 42.42.42.42
      ansible_user: devops
      ansible_ssh_port: 42
    desktop:
```

You can set the domain name/IP address, the user with ansible can login, the ssh port and etc...

### My roles

#### grub

Set music and font for grub

#### gui

Set up a GUI

## Resources

* [User guide](https://docs.ansible.com/ansible/latest/user_guide/index.html)
* [Ansible builtin](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html)
