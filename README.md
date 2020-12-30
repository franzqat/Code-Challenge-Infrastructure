# **Code Challenge Infrastructure**
 ## **Brief Description**
 ---
 This is a small project where it's asked to provision two Virtual Machine with CentOS and setup Docker using Ansible.

 The two VM will have a disk size of 40GB.

 The script for the disk resize is contained in disk-extend.sh
 It is run automatically by vagrant during provisioning

 ## **Quickstart: how to run**
 ---
 Browse to the repo folder and exec 
 
` $ vagrant up`

The provisioning will provide to install Docker and Docker-Compose using a task with Ansible.


### **Software list**
---

* Vagrant
* Ansible
* VirtualBox
* Git
 
**Vagrant plugin list:**
* vagrant-serverspec
* vagrant-disksize
* vagrant-hostsupdater
 

---

#### **Notes**
Vagrant file is not optimized but this is the only way I was able to run everything on Windows environment.
There are two inventory file: **hosts** and **inventory**. This was the solution I've found to allow ansible to run fine and install Docker correctly.


## License

MIT license (see [LICENSE][license])

[vagrant]: http://vagrantup.com
[serverspec]: http://serverspec.org

[franzqat]: https://github.com/franzqat

[license]: https://github.com/franzqat/Code-Challenge-Infrastructure/blob/master/LICENSE