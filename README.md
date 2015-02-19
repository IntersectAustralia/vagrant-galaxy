# Setting up the Developer Environment

Create a new folder for your project, this is where your script and tool definition wil live, e.g:

```
% mkdir my-new-galaxy-tool
```

## Install VirtualBox and Vagrant

The developer environment makes used of Vagrant, which in turn makes use of VirtualBox. VirtualBox can be found [here](https://www.virtualbox.org/), and Vagrant [here](https://www.vagrantup.com/).

Next, clone the Alveo developer environment. This will install and configure a virtual machine with a local instance of Galaxy to develop and test your tool with.

```
% git clone https://github.com/IntersectAustralia/vagrant-galaxy.git
```

## Configure Vagrant

Vagrant is configured to synchronise a local folder (your project folder), download the latest stable Galaxy, copy some Galaxy configuration files across, then link to the synchronised folder to where Galaxy can find it. What you need to do is edit the Vagrantfile to synchronise your the project folder you created earlier, e.g:

```
config.vm.synced_folder("../my-new-galaxy-tool", "/vagrant/tools-dev/my-new-galaxy-tool")
```

As well as editing the `config/alveo_tool_conf.xml` file to point to your sychronised tool definition file. The tool definition file is the XML file mentioned earlier in this guide which defines the inputs and outputs of your tool. It doesn’t matter if you have not created this file yet, it will be picked up by Galaxy when you do create it and restart the server. Continuing with our previous example, supposing your tool definition file was called my-new-galaxy-tool.xml, your `config/alveo_tool_conf.xml` would look like the following.

```
<?xml version='1.0' encoding='utf-8'?>
<!-- this file lists tools that we are developing and want to test in this Galaxy installation -->
<toolbox tool_path="tools-dev">
  <section id="dev" name="Development">
    <tool file="my-new-galaxy-tool/my-new-galaxy-tool.xml" />
  </section>
</toolbox>
```

NOTE: If you change the name of your tool definition file at a later point, you may need to log into the guest machine and manually edit the file there.

## Provision the Environment

If you have followed the previous steps, you should now be able to provision your server by typing the following in your vagrant-galaxy directory:

```
% vagrant up
```

Provisioning make some time since it needs to download the operating system image, then download and install Galaxy and all its dependencies. You can stop the machine with the followin command:

```
% vagrant halt
```

And completely remove the virtual machine with:

```
% vagrant destroy 
```

### Starting the Galaxy Server

Once Vagrant has successfully provisioned the environment and started the virtual machine, you can log in with:

```
% vagrant ssh
```

You can then change to the Galaxy directory and start the server:

```
% cd galaxy-dist
% ./run.sh
```

Point your browser to `127.0.0.1:8010` and you should see Galaxy running. The admin account can be accessed by registering a user with the email address `admin@test.org`.

