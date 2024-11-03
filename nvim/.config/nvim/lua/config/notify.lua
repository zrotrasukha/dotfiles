-- Ensure that nvim-notify is loaded before you attempt to configure it
local notify = require("notify")

-- Check if the notify module is loaded successfully
if notify then
  notify.setup({
    -- You can customize these options according to your requirements
    level = vim.log.levels.INFO, -- Set the default logging level
    timeout = 300, -- Notification timeout
    max_width = 80, -- Max width of notifications
    max_height = 20, -- Max height of notifications
    stages = "fade", -- Animation stages
    render = "default", -- Notification renderer
    background_colour = "#000000", -- Background color for notifications
    -- Optional custom icons
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })

  -- Example usage to test if configuration works
  notify("Notify has been configured!", "info", { timeout = 300 })
else
  print("Failed to load nvim-notify")
end
