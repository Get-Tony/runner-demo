# Runner Demo

This is a demo of the Runner framework.

## Requirements

The following commands must be available on the system:

- git
  - version: ```2.25.1```+
  - package_manager: ```git```
- ansible
  - version: ```2.9.6```+
  - package_manager: ```ansible```
  - pip: ```requirements.txt```
- ansible-runner
  - version: ```1.4.6```+
  - package_manager (Debian12+): ```ansible-runner```
  - pip: ```requirements.txt```

## Installing requirements with pip

Git must be installed on the system separately.
The following command will install the required python packages:

    pip3 install -r requirements.txt

## Dependencies

The following repositories will be cloned during the demo:

- [github.com/get-tony/service_service1](https://github.com/get-tony/service_service1)
- [github.com/get-tony/role_test](https://github.com/get-tony/role_test)

## Usage

- Execute:
  - ```./clone_service1.sh```
- Read and comply to:
  - ```services/service1/README.md```
- Execute:
  - ```./run.sh```

## License

This project is licensed under the MIT License.

## Author

This project was created by [Anthony Pagan](https://github.com/get-tony).

## Warning

This project is still in development and should not be used without proper testing.
Use at your own risk.
