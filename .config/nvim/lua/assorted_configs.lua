-- hightlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})

-- stops pasting in visual mode from yanking into the register 
vim.keymap.set("v", "p", "P")

-- remaps h to switch tabs
vim.keymap.set("n", "h", "gt")
vim.keymap.set("n", "H", "gT")

-- remaps hjkl to jklç
vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "l", "k")
vim.keymap.set("n", "ç", "l")

vim.keymap.set("n", "J", "H")
vim.keymap.set("n", "K", "J")
vim.keymap.set("n", "L", "K")
vim.keymap.set("n", "Ç", "L")

vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "l", "k")
vim.keymap.set("v", "ç", "l")

-- bind esc to leave terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- resize windows
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Down>", "<C-w>-")

-- ctrl+u and ctrl+d to the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- assorted configs
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 6
vim.opt.inccommand = 'split'
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.smartindent = true
vim.cmd.colorscheme("sorbet")

-- lazy vimscript configs
vim.cmd([[

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction
:command NumberToggle call NumberToggle()
nnoremap rn :call NumberToggle()<CR>

function! ToggleSideEffects()
    if mapcheck("dd", "n") == ""
        noremap dd "_dd
        noremap D "_D
        noremap d "_d
        noremap X "_X
        noremap x "_x
        echo 'side effects off'
    else
        unmap dd
        unmap D
        unmap d
        unmap X
        unmap x
        echo 'side effects on'
    endif
endfunction
nnoremap ,, :call ToggleSideEffects()<CR>
]])
