# mdview

A small Markdown-only viewer and editor for Debian, built with GTK 3 and WebKitGTK.

## Features

- GitHub-style rendering and heading anchors, so `[link](#some-heading)` jumps work
- Obsidian-style `[[#Heading|label]]` links are converted to normal anchors
- Light, dark and auto themes (`Ctrl+D`), with GitHub-like syntax colours in code blocks
- Edit mode with live preview and synchronized scrolling (`Ctrl+E`, save with `Ctrl+S`)
- Find and replace (`Ctrl+F`, `Ctrl+H`, `F3` / `Shift+F3`)
- Reloads automatically when the file changes on disk (never over unsaved edits)
- Relative links to other `.md` files open in the same tab, with back / forward (mouse buttons, `Alt+Left` / `Alt+Right`,
  or the header-bar arrows); middle-click or `Ctrl+click` a link to open it in a new tab. Web links open in your browser
- Tabs: open several files at once, switch with `Ctrl+Tab` in most-recently-used order (like Alt+Tab)
- Line-accurate scroll sync between the editor and the preview
- Undo / redo in the editor (`Ctrl+Z`, `Ctrl+Y`), with Markdown syntax colouring
- Large-file mode (over ~1 MB): the window opens immediately and the preview fills in progressively
- Regular-expression find and replace, with `\1` / `\g<name>` group references

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
| `Ctrl+O` | Open a file (in a new tab) |
| `Ctrl+W` | Close the current tab |
| `Ctrl+Tab` / `Ctrl+Shift+Tab` | Switch to the previous / next tab in most-recently-used order (hold `Ctrl`, tap `Tab` to go further back, release to switch, `Esc` to cancel) |
| `Ctrl+PgDn` / `Ctrl+PgUp` | Next / previous tab in tab-bar order |
| `Alt+1` ... `Alt+9` | Jump to that tab |
| `Alt+Left` / `Alt+Right`, mouse back / forward | Back / forward through followed links in this tab |
| `Ctrl+E` | Toggle edit mode |
| `Ctrl+S` | Save |
| `Ctrl+Z` / `Ctrl+Y` (or `Ctrl+Shift+Z`) | Undo / redo (while the editor has focus) |
| `Ctrl+F` / `Ctrl+H` | Find / find and replace |
| `F3` / `Shift+F3` | Next / previous match |
| `Ctrl+D` | Cycle theme (Auto, Light, Dark) |
| `Ctrl+R` | Reload from disk |
| `Ctrl+Q` | Quit |

## Troubleshooting

If the app does not start, run it from a terminal (`mdview file.md`). Crashes are also saved to
`~/.cache/mdview/last-error.log`.

## Known limitations

- Scroll sync follows source lines, but falls back to heading-to-heading and then to percentage sync for
  documents it cannot map (for example headings inside block quotes or lists, or complex raw HTML)
- Editor colouring is a lightweight approximation of Markdown (headings, emphasis, code, links, quotes, lists)
  and is skipped for very large files
- Files over ~1 MB open in large-file mode: rendering happens in the background and takes a while for very
  big files, the editor text is only loaded when you press Edit, and while editing there is no live preview,
  colouring or line-accurate scroll sync (saving re-renders the preview)
- Undo history is per tab and is cleared when a file is reloaded from disk
- Regular expressions work in the editor's find and replace only; the preview search is plain text

## License

MIT, see [LICENSE](LICENSE).
