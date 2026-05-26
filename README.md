# beam's neovim config

A couple of people in the stream chat have asked about my neovim config... so here it is.

It's written purely for myself, but please feel free to take anything you like.

**Note:** I consider my skill level in (n)vim to be around the 10-15% mark, e.g. noob, so take this config with a grain of salt.

Documentation is a work in progress. Heck, the whole repo is.

## Features

In no particular order...

### Window Manager (`lua/local/wm.lua`)

A simple window manager based on numeric indices.

Window numbers are derived on-demand based on geometry, increasing from left to right, top to bottom.

  - `<M-{1-8}>` - jump to window 1-8
  - `<M-S-{1-8}>` - move active buffer to window 1-8
  - `<M-{Left,Right}>` - cycle active window left/right (with wraparound)
  - `<M-=>` - equalize width of all windows
  - `<M-S-=>` - focus on active window (make it 70% of the available horizontal space)

Create windows as usual using e.g. `:sp` or `:vsp`. I typically only use vertical splits so the "equalise" and "focus" commands above sometimes result in undefined behaviour with horizontal splits. Not insurmountable, just never been a problem for me.

### File Tree (Neotree)

Just standard Neotree, with a bit of customisation.

  - `<M-0>` - focus on Neotree, open if not visible
  - `<M-S-0>` - toggle Neotree
  - `y` - copy path to `"` register (prompts for options)
  - `Y` - copy path to clipboard (prompts for options)
  - `O` - show file in system file explorer
  - `{1-8}` - open file in corresponding window index (window manager integration)

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

### Git Integration

Most of this is the `gitsigns` plugin.

  - `<leader>gb` - popup line blame
  - `<leader>gB` - open blame
  - `<leader>gt` - toggle current line blame
  - `<leader>gw` - toggle word diff
  - `<leader>gd` - diff this
  - `<leader>gD` - diff this (`~`)
  - `<leader>gsb` - stage buffer
  - `<leader>gsB` - reset buffer
  - `<leader>gsh` - stage hunk (works in normal/visual mode)
  - `<header>gsH` - reset hunk (works in normal/visual mode)
  - `<leader>gg` - open Git client (`lazygit` on Linux, Sublime Merge on macOS) (see `lua/local/os.lua` for implementation)

### Terminal Integration

  - `<M-Enter>` - launch terminal in workspace directory
  - `<M-S-Enter>` - launch terminal in active file directory

These commands are specific to my setup, and defined in `lua/local/os.lua`. Opens iTerm on macOS, and spawns Alacritty via `i3-msg` on Linux.






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

