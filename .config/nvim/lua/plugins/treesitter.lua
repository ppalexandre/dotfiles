return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "php", "javascript", "html", "css", "rust", "python" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
