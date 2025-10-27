vim.o.laststatus = 3

function mode()
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

vim.api.nvim_set_hl(0, "TextHL", {fg="#121315",bg="#e97dff",bold=true})
vim.api.nvim_set_hl(0, "SymbolHL", {fg="#e97dff",bg="#121315",bold=true})

local statusline = {
    '%#SymbolHL#','',
    '%#TextHL#','%{v:lua.mode()}',
    '%#SymbolHL#',' ',

    '%#SymbolHL#','',
    '%#TextHL#','%t', -- file
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
}

vim.o.statusline = table.concat(statusline, '')
