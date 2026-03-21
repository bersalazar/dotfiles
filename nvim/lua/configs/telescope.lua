require("telescope").setup({
  pickers = {
    find_files = {
      -- this is so find_files searches dotfiles
      hidden = true,
    },
    live_grep = {
      additional_args = function()
        -- this is so live_grep doesn't search through .git, node_modules, and vendor folders
        return {
          "--hidden" ,
          "--glob", "!**/.git/*",
          "--glob", "!**/node_modules/*",
          "--glob", "!**/vendor/*",
        }
      end,
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  },
})
