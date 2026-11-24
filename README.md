# mdview

A small Markdown-only viewer and editor for Debian, built with GTK 3 and WebKitGTK.

## Features

- GitHub-style rendering and heading anchors, so `[link](#some-heading)` jumps work
- Obsidian-style `[[#Heading|label]]` links are converted to normal anchors
- Light, dark and auto themes (`Ctrl+D`), with GitHub-like syntax colours in code blocks
- Edit mode with live preview and synchronized scrolling (`Ctrl+E`, save with `Ctrl+S`)
- Find and replace (`Ctrl+F`, `Ctrl+H`, `F3` / `Shift+F3`)
- Reloads automatically when the file changes on disk (never over unsaved edits)
- Relative links to other `.md` files open inside the app, web links open in your browser

## Install

Download the `.deb` from the Releases page, then:

```bash
sudo apt install ./mdview_<version>_all.deb
xdg-mime default mdview.desktop text/markdown   # optional: make it the default for .md files
```

## Run from source

```bash
sudo apt install python3 python3-gi python3-markdown python3-pygments \
    gir1.2-gtk-3.0 gir1.2-webkit2-4.1
python3 src/mdview path/to/file.md
```

On older Debian releases use `gir1.2-webkit2-4.0` instead of `gir1.2-webkit2-4.1`.

## Build the .deb

```bash
./build-deb.sh        # writes dist/mdview_<version>_all.deb
```

## Shortcuts

| Key | Action |
| --- | --- |
| `Ctrl+O` | Open a file |
| `Ctrl+E` | Toggle edit mode |
| `Ctrl+S` | Save |
| `Ctrl+F` / `Ctrl+H` | Find / find and replace |
| `F3` / `Shift+F3` | Next / previous match |
| `Ctrl+D` | Cycle theme (Auto, Light, Dark) |
| `Ctrl+R` | Reload from disk |
| `Ctrl+Q` | Quit |

## Troubleshooting

If the app does not start, run it from a terminal (`mdview file.md`). Crashes are also saved to
`~/.cache/mdview/last-error.log`.

## Known limitations

- Scroll sync is proportional (percentage based), not line by line
- The editor is plain text with no syntax colouring and no undo history beyond GTK's defaults
- Replace is plain text, not regular expressions

## License

MIT, see [LICENSE](LICENSE).
