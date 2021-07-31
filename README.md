# devtools

Soon™

## Installation

devtools is installed by running of the following command in your terminal. You can install this via the command-line with either curl or wget.

````
bash -c "$(curl -fsSL https://raw.githubusercontent.com/envoyr/devtools/main/bin/install.sh)"
````
or

````
git clone git@github.com:envoyr/devtools.git /root/.devtools
chmod +x /root/.devtools/devtools
ln -s "/root/.devtools/devtools" /usr/local/bin/devtools
````


## Documentation

### Core

````
devtools core install
devtools core update
devtools core autoupdate <enable|disable>
````

### Permissions
````
devtools permissions set <user> <folder>
````

### Project

````
devtools project add <user> <domain>
devtools project disable <name> <domain>
devtools project delete <name> <domain>
````

### User

````
devtools user add <user>
````

## License

The devtools project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
