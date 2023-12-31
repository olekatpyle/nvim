require('toggleterm').setup({
  open_mapping = [[<Leader>tt]],
  insert_mappings = true,
  terminal_mappings = true,
  highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      guibg = '#000000',
    },
    -- NormalFloat = {
    --   link = 'Normal',
    -- },
    -- FloatBorder = {
    --   guifg = nil,
    --   guibg = nil,
    -- },
  },
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'horizontal',
  close_on_exit = false,
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end,
  },
})
