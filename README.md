# Runner Demo

This is a demo of the Runner framework.

## Test environment

- Controller OS: Debian 11
- Python: 3.9.2
- Ansible: 2.9.6
- Git: 2.30.2
- Ansible-Runner: 1.4.6

## Installing Requirements

Run the following commands as root or with sudo to install the requirements:

    apt-get install git python3-pip ansible ansible-lint

## Installing Ansible-Runner

Ansible-Runner is not available in Debian 11's package manager.
Run the following command as root or with sudo to install with pip:

    pip3 install ansible-runner

## Dependencies

The following repositories will be cloned during the demo:

- [github.com/get-tony/service_service1](https://github.com/get-tony/service_service1)
- [github.com/get-tony/role_test](https://github.com/get-tony/role_test)

## Usage

Execute:

- ```./clone_service1.sh```
- ```./configure_service1```
- ```./run.sh```

## License

This project is licensed under the MIT License.

## Author

This project was created by [Anthony Pagan](https://github.com/get-tony).

## Warning

This project is still in development and should not be used without proper testing.
Use at your own risk.
