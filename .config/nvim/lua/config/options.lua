-- Put new window splits below and right 
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = true,  -- Show diagnostics as virtual text
    signs = true,        -- Show signs in the sign column
    underline = true,    -- Underline diagnostics
    update_in_insert = false,  -- Don't update diagnostics while in insert mode
    severity_sort = true,     -- Sort diagnostics by severity
})

-- Set up floating window border style
vim.o.winborder = 'rounded'

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.opt.completeopt = { "menu", "menuone", "noselect" }
