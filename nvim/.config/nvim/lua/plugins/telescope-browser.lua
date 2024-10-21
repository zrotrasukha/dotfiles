return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  require("telescope").setup({
    extensions = {
      file_browser = {
        cwd_to_path = true,
        select_buffer = true,
        hidden = { file_browser = true, folder_browser = true },
        depth = 1,
        respect_gitignore = false,
      },
    },
  }),
}
