# sys-installs

This folder contains files related to my dotfiles repository.

## Files

- `install-aws-cli.sh`  
  This Bash script installs the AWS Command Line Interface (AWS CLI) on Ubuntu Linux.  
  The script:
  - checks whether it is being run with `sudo` or as `root`
  - checks whether the `apt` package manager is available
  - asks the user to confirm before continuing
  - checks whether the `aws` command name already exists on the system
  - installs required dependencies silently
  - downloads and installs AWS CLI
  - prints a command the user can run to verify the installation

## Sources

- [AWS CLI User Guide for Linux installs](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) - used for the AWS CLI installation steps, including downloading the installer zip, unzipping it, and running the installer.
- [GNU Bash Manual](https://www.gnu.org/software/bash/manual/bash.html) - used as a reference for Bash scripting syntax and commands.

## Generative AI Use

I used ChatGPT in a limited way to help clarify parts of the assignment and double-check some sections of my script while working through it. I was able to use google as well to find information on the script i used. 

Prompt used:
I asked for help with specific parts of a Bash install script, such as checking for root access and handling package installation steps.
