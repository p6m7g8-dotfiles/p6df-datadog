# P6's POSIX.2: p6df-datadog

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

p6df module for Datadog: multi-language SDK installs, profile switching
(`DATADOG_API_KEY`, `DD_API_KEY`, `DD_SITE`), and MCP server
(`datadog-mcp-server`) for AI-driven observability queries.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-datadog

##### p6df-datadog/init.zsh

- `p6df::modules::datadog::clones()`
- `p6df::modules::datadog::deps()`
- `p6df::modules::datadog::init(_module, dir)`
  - Args:
    - _module
    - dir
- `p6df::modules::datadog::langs()`
- `p6df::modules::datadog::mcp()`
- `p6df::modules::datadog::profile::off()`
- `p6df::modules::datadog::profile::on(profile, env)`
  - Args:
    - profile
    - env
- `str str = p6df::modules::datadog::prompt::mod()`

## Hierarchy

```text
.
├── init.zsh
├── lib
└── README.md

2 directories, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
