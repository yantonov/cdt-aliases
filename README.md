# Intro
A set of [aliases](https://github.com/yantonov/cdt-aliases/blob/master/config.toml) for [cdt](https://github.com/criteo/command-launcher) tool

# Usage
1. add this repository to PATH.
2. build [alias](https://github.com/yantonov/alias) artifact (or use the available distribution),  
   name it as cdt and place into this repository (binary file has already ignored inside this repository).
3. alternative to (2), use
```bash
    install.sh
```
script that downloads latest alias binary name it as cdt and puts to the current directory

# Optional
Also you can install commit [hook](https://github.com/yantonov/ticket-commit-msg) that will include ticket number to the commit message automatically
