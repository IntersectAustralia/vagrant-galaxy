# vagrant-galaxy

Create a VM to develop Galaxy tools using Vagrant, specifically for the Alveo project. 

This is a configuration for Vagrant to build a VM with the Galaxy Workflow Engine installed 
ready for development of new tools. The script removes most of the default tools since we are 
working with text and speech data rather than gene sequences.   

The repository contains the source for a simple word frequency tool using the NLTK Python library.

Requires Vagrant and VirtualBox installed, when they are just enter

```
% vagrant up
```

and the VM should be configured and started. Then

```
% vagrant ssh
```
to login to the VM, then 

```
% cd galaxy-dist
% sh run.sh
```
and you should have a running Galaxy Workflow Engine.

# Tool Development

On the vagrant host machine, edit the `Vagrantfile` and add a folder that will sync with `/vagrant/tools-dev`, e.g:

```
config.vm.synced_folder("../my-new-galaxy-tool", "/vagrant/tools-dev/my-new-galaxy-tool")
```

Next, add a tool entry to the `config/alveo_tool_conf.xml` file which points to your tool definition file. The paths here are relative the Galaxy installation on the guest os, e.g. it should look something like the following:

```
<?xml version='1.0' encoding='utf-8'?>
<!-- this file lists tools that we are developing and want to test in this Galaxy installation -->
<toolbox tool_path="tools-dev">
  <section id="dev" name="Development">
    <tool file="my-new-galaxy-tool/my-new-galaxy-tool.xml" />
  </section>
</toolbox>
```
