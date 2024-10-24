require("telescope").setup({
  defaults = {
    file_ignore_patterns = {}, -- Clear ignored files if you want to show everything
  },
  pickers = {
    find_files = {
      -- Show hidden files and also files ignored by .gitignore
      hidden = true,
    },
  },
})
