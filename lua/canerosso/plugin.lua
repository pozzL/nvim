
-- latex plugin settings
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-pdf',
    '-synctex=1',
    '-interaction=nonstopmode',
    '-shell-escape',
  }
}


-- snippet settings
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
vim.g.UltiSnipsSnippetDirectories = { "~/Documenti/git/snippetVim" }


-- lsp settings
vim.lsp.config("clangd")
vim.lsp.config("texlab")
vim.lsp.config("lua_ls")

