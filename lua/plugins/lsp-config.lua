return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({})
      lspconfig.lua_ls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition'})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

-- return {
--     -- LSP Configuration & Plugins
--     'neovim/nvim-lspconfig',
--     dependencies = {
--         -- Automatically install LSPs to stdpath for neovim
--         'williamboman/mason.nvim',
--         'williamboman/mason-lspconfig.nvim',
--         'hrsh7th/nvim-cmp',
--
--         -- Useful status updates for LSP
--         -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
--         { 'j-hui/fidget.nvim', opts = {} },
--
--         -- Additional lua configuration, makes nvim stuff amazing!
--         'folke/neodev.nvim',
--     },
--     config = function()
--         -- mason-lspconfig requires that these setup functions are called in this order
--         -- before setting up the servers.
--         require('mason').setup()
--         require('mason-lspconfig').setup()
--
--         -- local on_attach = function(_, bufnr)
--         --     -- NOTE: Remember that lua is a real programming language, and as such it is possible
--         --     -- to define small helper and utility functions so you don't have to repeat yourself
--         --     -- many times.
--         --     --
--         --     -- In this case, we create a function that lets us more easily define mappings specific
--         --     -- for LSP related items. It sets the mode, buffer and description for us each time.
--         --     local nmap = function(keys, func, desc)
--         --         if desc then
--         --             desc = 'LSP: ' .. desc
--         --         end
--         --
--         --         vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--         --     end
--         --
--         --     nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--         --     nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--         --
--         --     nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
--         --     nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--         --     nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
--         --     nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
--         --     nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--         --     nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--         --
--         --     -- See `:help K` for why this keymap
--         --     nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--         --     -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--         --
--         --     -- Lesser used LSP functionality
--         --     nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--         --     nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--         --     nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--         --     nmap('<leader>wl', function()
--         --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--         --     end, '[W]orkspace [L]ist Folders')
--         --
--         --     -- Create a command `:Format` local to the LSP buffer
--         --     vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--         --         vim.lsp.buf.format()
--         --     end, { desc = 'Format current buffer with LSP' })
--         -- end
--         --
--         local function organize_imports()
--             local params = {
--                 command = "_typescript.organizeImports",
--                 arguments = { vim.api.nvim_buf_get_name(0) },
--             }
--             vim.lsp.buf.execute_command(params)
--         end
--
--         local servers = {
--             -- clangd = {},
--             gopls = {
--                 analyses = {
--                     unusedparams = true,
--                 },
--                 filetypes = { "go", "gomod", "gowork", "gotmpl" },
--                 gofumpt = true,
--                 staticcheck = true,
--             },
--             -- pyright = {},
--             -- rust_analyzer = {},
--             eslint = {},
--             tsserver = {
--                 filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--                 init_options = {
--                     preferences = {
--                         disableSuggestions = true,
--                     }
--                 },
--                 commands = {
--                     OrganizeImports = {
--                         organize_imports,
--                         description = "Organize Imports",
--                     },
--                 },
--             },
--             -- html = { filetypes = { 'html', 'twig', 'hbs'} },
--
--             lua_ls = {
--                 Lua = {
--                     workspace = { checkThirdParty = false },
--                     telemetry = { enable = false },
--                     -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--                     -- diagnostics = { disable = { 'missing-fields' } },
--                 },
--             },
--         }
--
--         vim.api.nvim_create_autocmd('LspAttach', {
--             group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--             callback = function(ev)
--                 -- Enable completion triggered by <c-x><c-o>
--                 vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--                 -- Buffer local mappings.
--                 -- See `:help vim.lsp.*` for documentation on any of the below functions
--                 local opts = { buffer = ev.buf }
--                 vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--                 vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--                 vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--                 vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--                 vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--                 vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--                 vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--                 vim.keymap.set('n', '<space>wl', function()
--                     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--                 end, opts)
--                 vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--                 vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--                 vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--                 vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--                 vim.keymap.set('n', '<space>f', function()
--                     vim.lsp.buf.format { async = true }
--                 end, opts)
--             end,
--         })
--
--         -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
--         local capabilities = vim.lsp.protocol.make_client_capabilities()
--         capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
--         -- Ensure the servers above are installed
--         local mason_lspconfig = require 'mason-lspconfig'
--
--         mason_lspconfig.setup {
--             ensure_installed = vim.tbl_keys(servers),
--         }
--
--         mason_lspconfig.setup_handlers {
--             function(server_name)
--                 require('lspconfig')[server_name].setup {
--                     capabilities = capabilities,
--                     -- on_attach = on_attach,
--                     settings = servers[server_name],
--                     filetypes = (servers[server_name] or {}).filetypes,
--                     init_options = (servers[server_name] or {}).init_options,
--                     commands = (servers[server_name] or {}).commands
--                 }
--             end,
--         }
--     end
--
-- }
