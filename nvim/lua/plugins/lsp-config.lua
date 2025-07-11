return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            lspconfig.lua_ls.setup { capabilities = capabilities }
            lspconfig.clangd.setup { capabilities = capabilities }
        end,
    }
}
