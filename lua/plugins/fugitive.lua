return {
    'tpope/vim-fugitive',
    config = function()
        Map("n", "<C-g>", "<cmd>G <CR>")
        Map("n", "<leader>gp", "<cmd>Git push <CR>", { desc = '[G]it [P]ush' })
        Map("n", "<leader>gp!", "<cmd>Git push -f<CR>", { desc = '[G]it [P]ush [F]orce' })
    end
}
