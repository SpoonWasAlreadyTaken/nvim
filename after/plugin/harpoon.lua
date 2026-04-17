local harpoon = require("harpoon")
harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
    default = {
        mappings = {
            list = {
                ["dd"] = function(ctx)
                    harpoon:list():remove_at(ctx.item_idx)
            end,
        },
    },
},
})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
