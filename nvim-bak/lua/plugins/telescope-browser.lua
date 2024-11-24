return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      extensions = {
        file_browser = {
          cwd_to_path = true,
          select_buffer = true,
          hidden = true, -- Show hidden files/folders
          respect_gitignore = true, -- Respect .gitignore
          depth = 1,
        },
      },
    })

    -- Load the file_browser extension after Telescope is set up
    require("telescope").load_extension("file_browser")
  end,
}
