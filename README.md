# numentext-html

HTML encode/decode and entity picker plugin for NumenText.

## Features

- HTML Encode: Convert special characters (&, <, >, ", ') to HTML entities
- HTML Decode: Convert HTML entities back to their character equivalents
- Insert HTML Entity: List common HTML entities in the output panel

## Installation

Copy or symlink this directory to your NumenText plugins folder:

```bash
mkdir -p ~/.numentext/plugins
cp -r numentext-html ~/.numentext/plugins/html
```

Or clone directly:

```bash
git clone https://github.com/numentech-co/numentext-html ~/.numentext/plugins/html
```

## Usage

The plugin adds three items to the Edit menu:

- **HTML Encode** -- encodes special characters in the active file
- **HTML Decode** -- decodes HTML entities in the active file
- **Insert HTML Entity...** -- lists common entities in the output panel

Commands are also available from the command palette:
- `html.encode`
- `html.decode`
- `html.entity`

## License

Apache License 2.0. See LICENSE file.
