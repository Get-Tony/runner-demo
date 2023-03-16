#!/usr/bin/ansible-playbook
# Hacky script to prepare the demo service for use.
# Anthony Pagan - 15/03/2023

- hosts: localhost
  gather_facts: false
  connection: local
  tasks:
    - name: "Check for required commands"
      command: "{{ item }} --version"
      register: required_commands
      failed_when: required_commands.rc != 0
      with_items:
        - git
        - ansible
        - ansible-runner
      ignore_errors: true
      changed_when: false

    - name: "Fail if required commands are missing"
      fail:
          msg: "Command '{{ item.item }}' not found. Please install it and try again."
      when: item.failed
      with_items: "{{ required_commands.results }}"

    - name: "Check if service1 repo exists"
      stat:
          path: services/service1
      register: service1_repo

    - name: "Clone the demo service repo"
      git:
          repo: https://github.com/get-tony/service_service1.git
          dest: services/service1
      when: not service1_repo.stat.exists

    - name: "Create host_vars directory"
      file:
          path: services/service1/inventory/host_vars
          state: directory

    - name: "Create group_vars directory"
      file:
          path: services/service1/inventory/group_vars
          state: directory

    - name: "Creating services/service1/inventory/group_vars/controllers.yml"
      copy:
        dest: services/service1/inventory/group_vars/controllers.yml
        content: |
            ---
            git_roles:
              - name: role_test
                repo: https://github.com/Get-Tony/role_test
                version: main

    - name: "Creating services/service1/inventory/host_vars/localhost.yml"
      copy:
        dest: services/service1/inventory/host_vars/localhost.yml
        content: |
            ---
            ansible_python_interpreter: /usr/bin/python3
            ansible_connection: local
