return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require('telescope.actions')
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                    },
                    n = {
                        ["<esc>"] = actions.close,
                        ["j"] = false,
                        ["k"] = false,
                        ["l"] = actions.move_selection_previous,
                        ["k"] = actions.move_selection_next
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
        vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
        vim.keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
        vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })
    end
}
