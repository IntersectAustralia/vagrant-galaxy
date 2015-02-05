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

On the vagrant host machine, create a symbolic link in the `tools/` folder to the folder containing the tool under development, e.g:

```
% pwd
/Users/devel/workspace/vagrant-galaxy/tools
ln -s /Users/devel/workspace/my-new-galaxy-tool
```

The `tools/` folder is synchronized with the vagrant guest OS and then linked to the `alveotools/alveo` sub directory. Next, add a tool entry to the `config/alveo_too_conf.xml` file which points to your tool definition file. The paths here are relative the Galaxy installation on the guest os, e.g. it should look something like the following:

```
<?xml version='1.0' encoding='utf-8'?>
<!-- this file lists tools that we are developing and want to test in this Galaxy installation -->
<toolbox tool_path="alveotools">
  <section id="dev" name="Development">
    <tool file="alveo/my-new-galaxy-tool/my-new-galaxy-tool.xml" />
  </section>
</toolbox>
```
