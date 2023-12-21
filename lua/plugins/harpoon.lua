return {
    'ThePrimeagen/harpoon',
    version = "*",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        Map("n", "<A-a>", mark.add_file)
        Map("n", "<A-e>", ui.toggle_quick_menu)

        Map("n", "<A-h>", function() ui.nav_file(1) end)
        Map("n", "<A-t>", function() ui.nav_file(2) end)
        Map("n", "<A-n>", function() ui.nav_file(3) end)
    end
}
