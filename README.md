# Jetbrains IDE config helper for Perforce

j4 speeds up setting up Perforce .p4config files in your Jetbrains IDE project.

The 'init' task sets up the global configuration values used by all projects.

The 'config' task reads the global configuration and any defined key/value pairs and creates a .p4config,
and creates a Perforce client based on all those values.

## Workflow

Initialize the global configuration

$ j4 init P4PORT=perforce:1666 P4CLIENT=myname-client

Create your project in your IDE.

From the terminal session in your new IDE project...

$ j4 config

This creates the .p4config and Perforce client.

Lastly, in your IDE, use VCS > Enable Version Control Integration... > Perforce

...and you're good to go!

## Installation
curl -sSL https://raw.githubusercontent.com/ssmythe/j4/master/install-j4.sh | sudo bash

## Usage
    Usage: j4: {task} [KEY=VALUE...]
    
    tasks:
    
    init   - creates default configuration file:
             /Users/ss250852/.j4.d/config
    
             This config file contains defaults that are copied and templated in the project config file.
    
             $ j4 init [KEY=VALUE...]
    
             /Users/ss250852/.j4.d/config contains:
             KEY=VALUE
    
             The tool also creates an editable Perforce client spec template:
             /Users/ss250852/.j4.d/clientspec
    
             This template is intended to be edited and use __KEY__ tokens
             to be substituted at config time.
    
             IMPORTANT: P4PORT is a required KEY/VALUE, p4:1666 is the Perforce default, but your system may vary.
    
    config - creates local project SCM config file: /Users/ss250852/Documents/RubymineProjects/jetbrains-p4-config-tool/.p4config
    
             $ j4 config [KEY=VALUE...]
    
             .p4config contains:
             {values from config file starting with P4}
    
             Perforce client spec created from template seeded with values
             in config and command line tokens
    
    display     - displays current configuration
    verify      - verify all tokens are substituted in project config file
    
    clean       - removes local project config
    cleanclient - removes Perforce client based on local project config
    cleaninit   - removes user config dir: /Users/ss250852/.j4.d
