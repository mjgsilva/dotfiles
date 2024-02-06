return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup({
                opleader = {
                    line = '<Leader>cc'
                },
                toggler = {
                    line = '<Leader>cc'
                }
            })
    end
}

