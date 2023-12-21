return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim"},
    -- 'ThePrimeagen/harpoon',
    -- version = "*",
    config = function()
        local harpoon = require("harpoon")
        -- local mark = require("harpoon.mark")
        -- local ui = require("harpoon.ui")

        Map("n", "<A-a>", function() harpoon:list():append() end)
        Map("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        Map("n", "<A-h>", function() harpoon:list():select(1) end)
        Map("n", "<A-t>", function() harpoon:list():select(2) end)
        Map("n", "<A-n>", function() harpoon:list():select(3) end)
    end
}
