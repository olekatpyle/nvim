local telescope = require('telescope')
local telescopeConfig = require('telescope.config')

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, '--hidden')
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!**/.git/*')

telescope.setup({
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
    },
    grep_string = {
      -- theme = 'cursor',
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
})

require('telescope').load_extension('notify')

-- Key mappings
vim.keymap.set(
  'n',
  '<Leader>ps',
  ':lua require("telescope.builtin").live_grep({prompt_title = "Live grep"}, require("telescope.themes").get_dropdown({}))<CR>',
  { noremap = true, silent = true }
)

vim.keymap.set(
  'n',
  '<Leader>pf',
  ':lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))<CR>',
  { noremap = true, silent = true }
)

vim.keymap.set(
  'n',
  '<Leader>ph',
  ':lua require("telescope.builtin").help_tags()<CR>',
  { noremap = true, silent = true }
)

vim.keymap.set(
  'n',
  '<Leader>pm',
  ':lua require("telescope.builtin").man_pages()<CR>',
  { noremap = true, silent = true }
)
