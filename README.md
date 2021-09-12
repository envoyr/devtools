# devtools

Soon™

## Installation

devtools is installed by running of the following command in your terminal. You can install this via the command-line with either curl or wget.

````
bash -c "$(curl -fsSL https://raw.githubusercontent.com/envoyr/devtools/main/bin/install.sh)"
````

## Installation (alternative)

````
git clone git@github.com:envoyr/devtools.git /root/.devtools
````

````
chmod +x /root/.devtools/devtools
ln -s "/root/.devtools/devtools" /usr/local/bin/devtools
````

## Setup

Get core functions enabled with:

````
devtools core install
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

### Domain

````
devtools domain add <domain>

Flags:
  --skip-certbot  Skip ssl certificates
  --www           Add www alias
  --try-files     Change try_files to '$uri $uri/ =404'
````

### User

````
devtools user add <user>
````

## License

The devtools project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
