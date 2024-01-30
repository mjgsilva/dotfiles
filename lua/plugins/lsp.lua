return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'williamboman/mason.nvim',
      opts = {
        ui = {
          icons = {
            package_installed = "✔",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      },
      dependencies = {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          automatic_installation = true
        },
        config = function()
          local lspconfig = require('lspconfig')
          local cmp_nvim_lsp = require('cmp_nvim_lsp')
          local api = vim.api
          local ns = { noremap = true, silent = true }

          local capabilities = cmp_nvim_lsp.default_capabilities()
          local on_attach = function(_client, bufnr)
             api.nvim_buf_set_keymap(bufnr, 'n', 'gF', '<cmd>lua vim.lsp.buf.definition()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', 'gC', '<cmd>lua vim.lsp.buf.declaration()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.format()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', ns)
             api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', ns)
          end

          lspconfig['elixirls'].setup({
            cmd = { 'elixir-ls' },
            root_dir = lspconfig.util.root_pattern({ 'mix.exs' }),
            on_attach = on_attach,
            capabilities = capabilities
          })
        end
      }
    }
  }
}
