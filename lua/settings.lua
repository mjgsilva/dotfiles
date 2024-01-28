local g = vim.g
local opt = vim.opt
local api = vim.api

-- General
opt.compatible = false
opt.mouse = 'a'
opt.clipboard = 'unnamed'
opt.swapfile = false
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240
opt.updatetime = 100
opt.filetype = 'off'
opt.filetype.plugin = 'on'
opt.filetype.indent = 'on'

-- Theme
opt.termguicolors = true

-- Editor
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smarttab = true
opt.textwidth = 80
opt.shiftwidth = 2
opt.autoindent = true
opt.copyindent = true
opt.smartindent = true
opt.splitright = true

opt.ruler = true
opt.number = true
opt.showcmd = true
opt.showmatch = true

opt.incsearch = true
opt.ignorecase = true
opt.hlsearch = true

opt.smartcase = true
opt.list = true
opt.listchars = 'tab:>.,trail:.,extends:#,nbsp:.'
opt.encoding = 'utf-8'
opt.completeopt= 'longest'

opt.syntax = 'enable'
opt.syntax = 'on'

opt.laststatus = 2

-- Misc
g.SuperTabClosePreviewOnPopupClose = 1
g.SuperTabLongestHighlight = 1

-- Window
local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })
api.nvim_create_autocmd(
    'VimResized',
    {
        group = wr_group,
        pattern = '*',
        command = 'wincmd =',
        desc = 'Automatically resize windows when the host window size changes.'
    }
)
