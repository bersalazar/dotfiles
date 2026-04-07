return {
  {
   "mfussenegger/nvim-dap",
  },
  {
   "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      require("dap-python").setup("/usr/bin/python3")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
    end,
  },
}
