### About
A set of [aliases](https://github.com/yantonov/cdt-aliases/blob/master/config.toml) for [cdt](https://github.com/criteo/command-launcher) tool.

### Installation
1. clone and add this repository to the front of PATH
2. use 
```bash
    install.sh
```
script that downloads latest [alias](http://github.com/yantonov/alias) distribution for the current operating system names it in appropriate way and puts to the current directory  

Alternatively, you can:  
a) build [alias](http://github.com/yantonov/alias) manually (or use the available distribution)  
b) name it as `cdt` and put it into this repository (binary file has already ignored inside this repository)  

### Shell integration
Completion scripts (aliases and alias groups from `config.toml`/`override.toml`, on top of the native cdt completion) live in the [completion](https://github.com/yantonov/cdt-aliases/tree/master/completion) directory, one per shell.
The current shell is detected through the `SHELL` variable, an unsupported shell is reported as an error.
```bash
    cdt shell show     # print the completion script for the current shell
    cdt shell install  # integrate with the current shell
```
`install` copies the completion script to the completion directory of the current shell, the exact path is printed by the command.
After the integration start a new shell (or source the installed file).

### Optional
Also you can install commit [hook](https://github.com/yantonov/ticket-commit-msg) that will include ticket number to the commit message automatically
