-- init.lua or your Neovim configuration file

local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-jest")({
      jestCommand = function()
        -- Get the current file name
        local current_file = vim.fn.expand("%:p")

        -- Construct the path to the test file
        local test_file = current_file:gsub("%.js$", ".test.js")

        -- Return the Jest command with the test file
        return "npx jest " .. test_file
      end,
      jestConfigFile = "jest.config.js", -- Update if you have a different config file
    }),
  },
})
