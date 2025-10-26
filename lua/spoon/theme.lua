require("nightfox").setup({
    palettes = {
        duskfox = {
            comment = "#424242",
            red = { base = "#ff005e", bright = "#ff005e", dim = "#c40048" },
            cyan = { base = "#008080", bright = "#00b8b8", dim = "#006363" },
            magenta = { base = "#beb7ff", bright = "#dad6ff", dim = "#746fa1" },
            blue = { base = "#da00f2", bright = "#938bb4", dim = "#4ec9b0" },
            bg1 = "#121315"
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


