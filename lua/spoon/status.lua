vim.o.laststatus = 3

function Mode()
    local m = vim.fn.mode()
    local modes = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "V-LINE",
        [""] = "V-BLOCK",
        c = "COMMAND",
        R = "REPLACE",
        t = "TERMINAL",
    }
    return modes[m] or m
end

local function setup_custom_highlights()
    vim.api.nvim_set_hl(0, "TextHL", {fg="#121315",bg="#e97dff",bold=true})
    vim.api.nvim_set_hl(0, "SymbolHL", {fg="#e97dff",bg="#121315",bold=true})
    vim.api.nvim_set_hl(0, "CursorLineNr", {fg="#ff7c36",bg="#121315",bold=true})
    vim.api.nvim_set_hl(0, "CursorLine", {bg = "none"})
    vim.api.nvim_set_hl(0, "LspInlayHint", {fg = "#26324d",bg = "#121315",italic = true,})
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = setup_custom_highlights,
})
setup_custom_highlights()


local statusline = {
    '%#TextHL#',' %{v:lua.Mode()}',
    '%#SymbolHL#','',

    '%#SymbolHL#','',
    '%#TextHL#',' %t', -- file
    '%r', -- if is read only
    '%m', -- if modified
    ' %#SymbolHL#','',

    '%=', -- splits left and right


    '%#SymbolHL#','',
    '%#TextHL#',' %{&filetype} ', --file type
    '%#SymbolHL#','',

    '%#SymbolHL#','',
    '%#TextHL#',' %l', -- line number
    ':',
    '%c ', -- column number
    '%#SymbolHL#','',

    '%#SymbolHL#','',
    '%#TextHL#',' %2p%% ', -- view percentige
    '%#SymbolHL#','',

    '%#SymbolHL#','',
    '%#TextHL#',' %{winnr()} ', --  window number
}

vim.o.statusline = table.concat(statusline, '')
