# Guides

## Operating on Multiple Files

Start by using Telescope to select multiple files (e.g. in find files or Live grep mode), using `<Tab>` to select the files you're interested in. Once all files are selected, `<M-q>` adds them to the quickfix list.

Then, we can use e.g. `:cdo` to run commands across the quicklist entries, followed by `:wa` to save all changes.
