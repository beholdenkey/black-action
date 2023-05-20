# Black Code Formatter GitHub Action

[![Stable Version](https://img.shields.io/github/v/tag/beholdenkey/black-action)](https://github.com/beholdenkey/black-action/tags) [![Latest Release](https://img.shields.io/github/v/release/beholdenkey/black-action?color=%233D9970)](https://github.com/beholdenkey/black-action/releases)

This GitHub Action runs the [Black code formatter](https://github.com/psf/black) on your Python code.

## Usage

To use this action, you can create a `.github/workflows/format-code.yml` file (or name it as you prefer) in your repository. Here's an example configuration:

```yaml
name: Code Formatting

on: [push, pull_request]

jobs:
  format:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Run Black Formatter
      uses: beholdenkey/black-action@main
      with:
        args: ". --check"
```

In this example, Black will check all Python files in the repository (denoted by .) whenever a push or pull request is made. The --check argument makes Black exit with a status code of 1 if any files would be reformatted, allowing you to identify unformatted code without modifying the files.

### Configuration

This action accepts the same arguments as the black command line tool. For a full list of possible arguments, refer to the [Black documentation](https://black.readthedocs.io/en/stable/the_black_code_style/current_style.html#command-line-options).

## Questions or issues?

If you have any issues or questions, don't hesitate to open an issue in this repository.
