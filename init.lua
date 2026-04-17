require("spoon")

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local filepath = vim.api.nvim_buf_get_name(0)
        if filepath == "" then return end

        local root = vim.fs.root(filepath, { ".git", "*.cpp", "*.c", "*.hpp" ,"*.h", "*.lua" })

        if root then
            vim.fn.chdir(root)
        end
    end,
})
