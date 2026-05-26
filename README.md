# beam's neovim config

A couple of people in the stream chat have asked about my neovim config... so here it is.

It's written purely for myself, but please feel free to take anything you like.

**Note:** I consider my skill level in (n)vim to be around the 10-15% mark, e.g. noob, so take this config with a grain of salt.

Documentation is a work in progress. Heck, the whole repo is.

## Features

In no particular order...

### `make` integration

  - `<F5>` - run `make`
  - `<F6>` - run `make run`; shell output appears in split shell (use `:bd!` to kill, not `:q`, otherwise the process will persist)

### Shunt (`lua/local/shunt.lua`)

Shunt is a plugin for storing transitory reference material; I use it mostly for displaying type and constant definitions while working across multiple files. The "shunt buffer" floats on the right of the screen and accumulates content that is pushed into it. Individual entries can be yanked and deleted.

  - `<leader>ss` - toggle shunt window
  - `<leader>s<CR>` - shunt selected text
  - `<leader>sh` - shunt trimmed LSP hover text
  - `<leader>sH` - shunt full LSP hover text
  - `<leader>st` - shunt type (see below)
  - `<leader>sw` - toggle shunt window width
  - `<leader>sc` - clear shuntlist
  - `<leader>sk` - kill shunt entry (prompts for input)
  - `<leader>sy` - yank shunt entry (prompts for input)

For best results, `shunt type` needs to be implemented per-filetype. I haven't got around to implementing any yet, but if you're up for it, they are defined in `shunt_type.lua`.

### Window History (`lua/local/window-history.lua`)

Maintains a navigable list of buffers visited in each window.

  - `<leader>[` - previous window buffer
  - `<leader>]` - next window buffer








## Shortcuts

These aren't all necessarily custom... more of an aide-memoire for me...

  - `<F2>` - rename (VSCode muscle memory...)
  - `<F12>` - goto definition (ditto...)
  - `=` - LSP reformat
  - `<C-l>` - redraw the screen, clear search

### Autocompletion/LSP stuff

  - `<C-Enter>` - LSP code actions
  - `<C-Space>` - summon autocompleter
  - `<C-{n,p}>` - next/previous autocompletion

### Buffer navigation

  - `<leader><leader>` - Telescope buffer switcher
  - `<leader><BS>` - Alternate buffer
  - `<leader>[` - Previous buffer
  - `<leader>]` - Next buffer
  - `<leader>b` - General buffer leader

### i3 Integration

  - `<M-Enter>` - pop up a terminal, working dir = workspace root
  - `<M-S-Enter>` - pop up a terminal, working dir = active file dir
  - `<leader>gg` - pop up `lazygit` (Linux) or Sublime Merge (macOS)

## Editing

  - (I) `<C-BS>` - delete word
  - (N/I) - `<M-S-{Up,Down}>` - move line up/down

## Yank/Paste

  - `:%Y` - yank all lines (or any other range) to system clipboard
  - `:%P` - paste over given range from system clipboard (not currently working)

## Windows

Window numbering is derived on-demand based on geometry, increasing from left to right.

  - `<M-0>` - focus on Neotree, open if not visible
  - `<M-S-0>` - toggle Neotree
  - `<M-{1-4}>` - jump to window 1-4
  - `<M-S-{1-4}>` - move active buffer to window 1-4
  - `<M-{Left,Right}>` - cycle active window left/right (with wraparound)
  - `<M-=>` - equalize width of all windows
  - `<M-S-=>` - focus on active window (make it 70% of the available horizontal space)

In Neotree, pressing `{1-4}` will open file in the corresponding window (assumes target window exists).

