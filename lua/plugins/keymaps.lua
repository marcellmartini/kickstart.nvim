return {
    -- Resie with arrow keys
    Map("n", "<C-Up>", ":resize -2<CR>"),
    Map("n", "<C-Down>", ":resize +2<CR>"),
    Map("n", "<C-Left>", ":vertical resize -2<CR>"),
    Map("n", "<C-Right>", ":vertical resize +2<CR>"),

    -- Move texts
    Map("v", "K", ":m '<-2<CR>gv=gv"),
    Map("v", "J", ":m '>+1<CR>gv=gv"),
    Map("v", "<", "<gv"),
    Map("v", ">", ">gv"),

    -- Move between tabs
    Map("n", "<TAB>", ":tabNex<CR>", { desc = '[N]ext [T]ab' }),
    Map("n", "<S-TAB>", ":tabp<CR>", { desc = '[P]revious [T]ab' }),
    Map("n", "<leader>nt", ":tabnew<CR>", { desc = '[N]ew [T]ab' }),
    Map("n", "<leader>nc", ":tabclose<CR>", { desc = '[N]ew [C]lose' }),

    -- custom telescope
    Map("n", "<leader>sa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
        { desc = '[S]earch [A]ll' }),
    Map("n", "<leader>sb", "<cmd> Telescope buffers <CR>", { desc = '[S]earch [B]uffers' }),
    Map("n", "<leader>so", "<cmd> Telescope oldfiles <CR>", { desc = '[S]earch [O]ldfiles' }),
    Map("n", "<leader>sc", "<cmd> Telescope colorscheme <CR>", { desc = '[S]earch [C]olorscheme' }),
    Map("n", "<leader>sC", "<cmd> Telescope git_commits <CR>", { desc = '[S]earch Git [C]commits' }),

    -- others
    Map("n", "J", "mzJ`z"),
    Map("n", "<C-d>", "<C-d>zz"),
    Map("n", "<C-u>", "<C-u>zz"),
    Map('n', '#', '#zz'),
    Map('n', '*', '*zz'),
    Map("n", "n", "nzzzv"),
    Map("n", "N", "Nzzzv"),

    Map("i", "<C-c>", "<ESC>"),
}
