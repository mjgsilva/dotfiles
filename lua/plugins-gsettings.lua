local g = vim.g
local env = vim.env

-- FZF
g.fzf_buffers_jump = 1
env.FZF_DEFAULT_OPTS = '--layout=reverse --bind ctrl-d:page-down,ctrl-u:page-up'
env.FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,.DS_Store,deps,_build,.elixir_ls}/*" 2> /dev/null'

-- Vim-test
g['test#strategy'] = 'neoterm'

-- Neoterm
g.neoterm_default_mod = 'vertical'
g.neoterm_automap_keys = 'tt'
g.neoterm_fixedsize = 1
g.neoterm_autoscroll = 1

-- Projectionist
g.projectionist_heuristics = {
      ['package.json'] = {
            ['src/*.js'] = {['alternate'] = '{}.test.js', ['type'] = 'source'},
            ['src/*.test.js'] = {['alternate'] = 'src/{}.js', ['type'] = 'test'}
      },
      ['mix.exs'] = {
            ['lib/*.ex'] = {['alternate'] = 'test/{}_test.exs', ['type'] = 'source'},
            ['test/*_test.exs'] = {['alternate'] = 'lib/{}.ex', ['type'] = 'test'}
      }
}

-- Airline
g['airline_theme'] = 'oceanicnext'
g['airline#extensions#tabline#enabled'] = 1

-- Nerdtree
g.NERDTreeShowHidden = 1
g.NERDTreeIgnore = {".DS_Store$"}

-- Multicursors
g.multi_cursor_use_default_mapping = 0
g.multi_cursor_start_word_key = '<C-i><C-n>'
g.multi_cursor_next_key = '<C-i><C-n>'
g.multi_cursor_select_all_word_key = '<C-i><C-l>'
g.multi_cursor_quit_key = '<Esc>'
