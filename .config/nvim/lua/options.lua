vim.opt.number = true

vim.opt.undofile = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- 0 defaults to tabstop value

vim.opt.termguicolors = true

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
            [vim.diagnostic.severity.HINT] = "DiagnosticInfo",
            [vim.diagnostic.severity.INFO] = "DiagnosticHint",
        },
    }
})

-- Yank to system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Disable auto comment
vim.cmd([[autocmd FileType * set formatoptions-=cro]])

