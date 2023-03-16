# Runner Demo

This is a demo of the Runner framework.

## Demo workflows

### Controller level

1. Run pre install checks to ensure the environment is ready.
2. Clone defined service(s) locally.
3. Configure the service(s) for the environment, if required.
4. Run the service(s).

### Service level

1. Clone and include any defined git based roles locally.
2. Apply any defined Ansible roles.

### Role level

1. Gather network facts from target host.
2. Display the IPv4 address(s) of the target host.

## Test environment

- Controller OS: Debian 11
- Python: 3.9.2
- Ansible: 2.9.6
- Git: 2.30.2
- Ansible-Runner: 1.4.6

## Installing Requirements

Run the following commands as root or with sudo to install the requirements:

    $: apt-get install git python3-pip ansible ansible-lint

## Installing Ansible-Runner

Ansible-Runner is not available in Debian 11's package manager.
Run the following command as root or with sudo to install with pip:

    $: pip3 install ansible-runner

## Usage

If an HTTP(S) proxy is required, see the [HTTP(S) Proxy](#http(s)-proxy) section below.

    $: ./fun_full_demo.sh

## HTTP(S) Proxy

In order to use an HTTP(S) proxy, correct and prepend one or both of the following environment variables to the command show in the [Usage](#usage) section above:

    $: http_proxy=http://proxy.example.com:8080 https_proxy=http://proxy.example.com:8080

## License

This project is licensed under the MIT License.

## Author

This project was created by [Anthony Pagan](https://github.com/get-tony).

## Warning

This project is still in development and should not be used without proper testing.
Use at your own risk.
