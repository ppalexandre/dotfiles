return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
    config = function ()
        require("oil").setup({
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = false,
            cleanup_delay_ms = 2000,

            constrain_cursor = "editable",
            watch_for_changes = false,

            win_options = {
                signcolumn = "yes:2",
            },

            -- keymaps = {
            --     ["g?"] = { "actions.show_help", mode = "n" },
            --     ["<CR>"] = "actions.select",
            --     ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            --     ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            --     ["<C-t>"] = { "actions.select", opts = { tab = true } },
            --     ["<C-p>"] = "actions.preview",
            --     ["<C-c>"] = { "actions.close", mode = "n" },
            --     ["<C-l>"] = "actions.refresh",
            --     ["-"] = { "actions.parent", mode = "n" },
            --     ["_"] = { "actions.open_cwd", mode = "n" },
            --     ["`"] = { "actions.cd", mode = "n" },
            --     ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            --     ["gs"] = { "actions.change_sort", mode = "n" },
            --     ["gx"] = "actions.open_external",
            --     ["g."] = { "actions.toggle_hidden", mode = "n" },
            --     ["g\\"] = { "actions.toggle_trash", mode = "n" },
            -- },

            use_default_keymaps = true,
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, bufnr)
                    local m = name:match("^%.")
                    return m ~= nil
                end,
                is_always_hidden = function(name, bufnr)
                    return false
                end,
                natural_order = "fast",
                case_insensitive = false,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
                highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                    return nil
                end,
            },
            git = {
                add = function(path)
                    return false
                end,
                mv = function(src_path, dest_path)
                    return false
                end,
                rm = function(path)
                    return false
                end,
            },
        })
    end
}
