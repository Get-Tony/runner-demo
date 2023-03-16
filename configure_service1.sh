#!/usr/bin/ansible-playbook
# Hacky script to prepare the demo service for use.
# Anthony Pagan - 15/03/2023

- hosts: localhost
  gather_facts: false
  connection: local
  vars:
    #http_proxy: http://

  tasks:
    - name: "Check for required commands"
      ansible.builtin.command: "{{ item }} --version"
      register: required_commands
      failed_when: required_commands.rc != 0
      with_items:
        - git
        - ansible
        - ansible-runner
      ignore_errors: true
      changed_when: false

    - name: "Fail if required commands are missing"
      ansible.builtin.fail:
          msg: "Command '{{ item.item }}' not found. Please install it and try again."
      when: item.failed
      with_items: "{{ required_commands.results }}"

    - name: "Check if service1 repo exists"
      ansible.builtin.stat:
          path: services/service1
      register: service1_repo

    - name: Set git http_proxy
      git_config:
        - name: http_proxy
          value: "{{ http_proxy }}"
          scope: local
      when: http_proxy is defined

    - name: "Clone the demo service repo"
      ansible.builtin.git:
          repo: https://github.com/get-tony/service_service1.git
          dest: services/service1
      when: not service1_repo.stat.exists

    - name: "Create host_vars directory"
      ansible.builtin.file:
          path: services/service1/inventory/host_vars
          state: directory

    - name: "Create group_vars directory"
      ansible.builtin.file:
          path: services/service1/inventory/group_vars
          state: directory

    - name: "Creating services/service1/inventory/group_vars/controllers.yml"
      ansible.builtin.copy:
        dest: services/service1/inventory/group_vars/controllers.yml
        content: |
            ---
            git_roles:
              - name: role_test
                repo: https://github.com/Get-Tony/role_test
                version: main

    - name: "Creating services/service1/inventory/host_vars/localhost.yml"
      ansible.builtin.copy:
        dest: services/service1/inventory/host_vars/localhost.yml
        content: |
            ---
            ansible_python_interpreter: /usr/bin/python3
            ansible_connection: local

    - name: "Check if services/service1/env/envvars exists"
      ansible.builtin.stat:
          path: services/service1/env/envvars
      register: envvars

    - name: "Activating envvars"
      ansible.builtin.copy:
          src: services/service1/env/envvars_demo
          dest: services/service1/env/envvars
      when: not envvars.stat.exists
