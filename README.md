# devtools

Soon™

## Installation

devtools is installed by running of the following command in your terminal. You can install this via the command-line with either curl or wget.

````bash
bash -c "$(curl -fsSL https://github.com/envoyr/devtools/blob/main/bin/install.sh)"
````

## Documentation

### Core

````bash
devtools core install
devtools core update
devtools core autoupdate <enable|disable>
````

### Permissions
````bash
devtools permissions set <user> <folder>
````

### Project

````bash
devtools project add <user> <domain>
devtools project disable <name> <domain>
devtools project delete <name> <domain>
````

### User

````bash
devtools user add <user>
````

## License

The devtools project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
