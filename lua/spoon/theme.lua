require("nightfox").setup({
    palettes = {
        duskfox = {
            comment = "#424242",
            red = {
                base = "#938bb4", -- function call
                bright = "#000000", -- nothing yet
                dim = "#a769ff" -- operators and types
            },
            cyan = {
                base = "#000000", -- nothing yet
                bright = "#00c7a2", -- namespace types
                dim = "#000000" -- nothing yet
            },
            magenta = {
                base = "#beb7ff", -- const and public/private
                bright = "#ff005d", -- conditionals
                dim = "#000000" -- nothing yet
            },
            blue = {
                base = "#ffb5fd", -- local variables
                bright = "#c3a3ff", -- functions 
                dim = "#000000" -- nothing yet
            },
            pink = {
                base = "#000000", -- nothing yet
                bright = "#b568d4", -- include
                dim = "#000000" -- nothing yet
            },
            orange = {
                base = "#f1cfff", -- numbers
                bright = "#6f009c", -- enums and null
                dim = "#000000" -- nothing yet
            },
            yellow = {
                base = "#ff7c36", -- type specifier brackets and highlights
                bright = "#ffe770", -- escape code?
                dim = "#000000" -- nothing yet
            },
            white = {
                base = "#ffffff",
                bright = "#ffffff",
                dim = "#e2e2e2"
            },
            bg1 = "#121315",
        },
    },
    specs = {
        duskfox = {
            syntax = {
                builtin1 = "red.dim",
                operator = "red.dim",
            },
        },
    },
    options = {
        styles = {
            conditionals = "bold",
            keywords = "bold",
            functions = "bold",
        },
    },

})
-- super sexy
vim.cmd("colorscheme duskfox")

