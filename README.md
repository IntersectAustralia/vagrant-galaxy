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


