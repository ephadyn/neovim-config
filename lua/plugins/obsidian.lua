return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
        keys = {
            { "<leader>O", "<cmd>Obsidian<cr>", desc = "Open Obsidian workspace" },
            { "<leader>oa", "<cmd>ObsidianAdd<cr>", desc = "Add current file to Obsidian workspace" },
            { "<leader>or", "<cmd>ObsidianRemove<cr>", desc = "Remove current file from Obsidian workspace" },
            { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search for text in Obsidian workspace" },
            { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find file in Obsidian workspace" }
        },
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Vault",
        },
      },
    },
  },
}

