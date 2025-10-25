require("nightfox").setup({
    palettes = {
        duskfox = {
            comment = "#424242",
            red = "#c40048",
            cyan = "#108080",
            magenta = "#938bb4",

        },
    },
    options = {
        styles = {
            keywords = "bold",
            functions = "italic,bold",
        },
    },

})
-- super sexy
vim.cmd("colorscheme duskfox")


