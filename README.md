# cdt-aliases

A collection of aliases for [cdt](https://github.com/yantonov/alias), powered by [alias](https://github.com/yantonov/alias).

## Table of contents

- [Installation](#installation)
- [Aliases](#aliases)
- [Shell integration](#shell-integration)
- [Customization](#customization)
- [Git commit hook](#git-commit-hook)

## Installation

Clone the repository and run the installation script:

```bash
git clone https://github.com/yantonov/cdt-aliases.git
cd cdt-aliases
./install.sh
```

Add the repository directory to the beginning of your `PATH`.

Alternatively, build or download the [alias](https://github.com/yantonov/alias) executable, name it `cdt`, and place it in the repository directory.

## Aliases

- `cdt initcs` — initialize a C# project.
- `cdt initj` — initialize a Java project.
- `cdt initgo` — initialize a Go project.
- `cdt cproj` — check out projects using `checkout-projects.sh`.
- `cdt co` — check out a project using `moab checkout`.
- `cdt exec` — execute commands using `moab exec` with one thread.
- `cdt git` — run Git commands through `moab exec` with one thread.
- `cdt hooks` — install Git hooks.
- `cdt jira` — add a Jira prefix using `add-jira-prefix.sh`.
- `cdt ide` — launch the IDE integration.
- `cdt rmoab` — refresh the Moab environment.
- `cdt st` — show Moab status.
- `cdt ws cs`, `cdt ws go`, `cdt ws java` — open C#, Go, and Java workspaces.
- `cdt shell show`, `cdt shell install` — show or install shell completion.

## Shell integration

Display and install shell completion scripts:

```bash
cdt shell show
cdt shell install
```

Start a new shell or source the installed completion script to activate completion.

## Customization

Edit `config.toml` to add or modify aliases. Use `override.toml` for project-specific shortcuts without changing the shared configuration.

For example, to define a shortcut for a specific project:

```toml
[alias.get]
main-project = "!cdt ws cs team/super-duper-project"
```

See the [alias documentation](https://github.com/yantonov/alias#alias-types) for more configuration options.

## Git commit hook

Install the optional commit hook to automatically include a ticket number in commit messages. Use the repository's `install-hooks.sh` script.
