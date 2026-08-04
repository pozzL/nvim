vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) 

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', 
                { desc = 'Trova file' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', 
                { desc = 'Cerca testo' })
vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>', 
                { silent = true, desc = "Apri File Explorer" })

-- LSP shorcuts if it is enebled
vim.keymap.set('n', 'K', vim.lsp.buf.hover, 
                { desc = "Mostra documentazione" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, 
                { desc = "Vai alla definizione" })

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, 
                { desc = "Azioni sul codice" })

