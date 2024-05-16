local g = vim.g
local set = vim.api.nvim_set_keymap
local s = { silent = true }
local n = { noremap = true }
local ns = { noremap = true, silent = true }

-- General
g.mapleader = ' '

-- Mapping
set('i', '<c-j>', '<esc>', s)
set('n', '<C-j>', '<Insert>', s)
set('v', '<C-k>', '<esc>', s)
set('n', '<Leader>w', ':w<CR>', ns)
set('n', '<Leader>q', ':q<CR>', ns)
set('n', '<Leader>t', ':tabe<CR>', ns)
set('n', '<Leader>h', ':nohlsearch<CR>', ns)
set('n', '<Leader>gb', ':Git blame<CR>', ns)

-- Directions
set('i','<down>', '<nop>', s)
set('i','<up>', '<nop>', s)
set('i','<right>', '<nop>', s)
set('i','<left>', '<nop>', s)
set('n', '<down>', '<nop>', s)
set('n', '<up>', '<nop>', s)
set('n', '<right>', '<nop>', s)
set('n', '<left>', '<nop>', s)

-- Search
set('n', '<c-p>', ':FZF<CR>', s)
set('n', 'F', ':Rg <C-R><C-W><CR>', ns)
set('n', '<Leader>a', ':Rg<Space>', n)

-- FZF
set('i', '<c-x><c-f>', '<plug>(fzf-complete-path)', s)

-- Nerdtree
set('n', '<C-n>', ':NERDTreeToggle<CR>', s)
set('n', '<Leader>nn', ':NERDTreeFind<CR>', s)
set('n', '<Leader>nr', ':NERDTreeRefreshRoot<CR>', ns)

-- Vim-test
set('n', '<Leader>nt', ':TestNearest<CR>', ns)
set('n', '<Leader>ff', ':TestFile<CR>', ns)
set('n', '<Leader>ss', ':TestSuite<CR>', ns)
set('n', '<Leader>ll', ':TestLast<CR>', ns)

-- Neoterm
set('t', '<C-e>', '<C-\\><C-n>', ns)
set('n', '<leader>m1', ':Ttoggle<cr>', s)
set('n', '<leader>m2', ':Tclear<cr>', s)
set('n', '<leader>m3', ':Tkill<cr>', s)

-- Projectionist
set('n', '<leader>u1', ':A<cr>', s)
set('n', '<leader>u2', ':AV<cr>', s)

-- Fujitive
set('n', '<leader>gh', ':silent execute "!tmux new-window tig " . expand("%:p")<CR>', s)
