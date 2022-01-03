# devtools

Soon™

## Installation

devtools is installed by running of the following command in your terminal. You can install this via the command-line with either curl or wget.

````
bash -c "$(curl -fsSL https://raw.githubusercontent.com/envoyr/devtools/main/bin/install.sh)"
````

## Setup

Everything should be provided automatically now.

## Documentation

### Adding new domains

````
devtools domain add <user> <domain>

Options:
  --skip-certbot                            Skip ssl certificates
  --www                                     Add www alias
  --try-files                               Change try_files to '$uri $uri/ =404'
  --domains="example.com www.example.com"   Add custom alias (overrides --www flag)
````

See [Help](HELP) for more informations.

## License

The devtools project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
