return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "bash",
            "css",
            "go",
            "html",
            "helm",
            "terraform",
            "javascript",
            "json",
            "lua",
            "markdown",
            "python",
            "typescript",
            "yaml",
        },
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
        },
    },
}
