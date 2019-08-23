Cassandra Ansible Role
======================
[![Build Status](https://travis-ci.org/mjcramer/ansible-role-cassandra.svg?branch=master)](https://travis-ci.org/mjcramer/ansible-role-cassandra) [![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-mjcramer.cassandra-blue.svg)](https://galaxy.ansible.com/mjcramer/cassandra/) 

An ansible role for installing Cassandra

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

Currently, the oracle and openjdk JVMs are supported. 

| Name | Value |
| --- | --- |
| cassandra_version | 3.11 |


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

- mjcramer.system
- mjcramer.java

Tags
----
- require
- download
- apply
- configure
- initialize
- check


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: mjcramer.cassandra, x: 42 }

License
-------

Unlicensed


Author Information
------------------

[Michael Cramer](http://michael.cramer.name), *michael@cramer.name* [_mjcramer_](http://github.com/mjcramer)
