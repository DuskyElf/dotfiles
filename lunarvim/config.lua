-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = true
lvim.keys.insert_mode["kj"] = "<Esc>"
lvim.transparent_window = true

lvim.keys.normal_mode["H"] = ":bprev<cr>"
lvim.keys.normal_mode["L"] = ":bnext<cr>"

lvim.builtin.dap.active = true

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

function RUST()
    require("rust-tools").setup({
        tools = {
            executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
            reload_workspace_from_cargo_toml = true,
            runnables = {
                use_telescope = true,
            },
            inlay_hints = {
                auto = true,
                only_current_line = false,
                show_parameter_hints = true,
                parameter_hints_prefix = ":",
                other_hints_prefix = "-> ",
                max_len_align = false,
                max_len_align_padding = 1,
                right_align = false,
                right_align_padding = 7,
                highlight = "Comment",
            },
            hover_actions = {
                border = "rounded",
            },
            on_initialized = function()
                vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                    pattern = { "*.rs" },
                    callback = function()
                        local _, _ = pcall(vim.lsp.codelens.refresh)
                    end,
                })
            end,
        },

        server = {
            on_attach = function(client, bufnr)
                require("lvim.lsp").common_on_attach(client, bufnr)
                local rt = require "rust-tools"
                -- vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
            end,
            capabilities = require("lvim.lsp").common_capabilities(),
            settings = {
                ["rust-analyzer"] = {
                    lens = {
                        enable = true,
                    },
                    checkOnSave = {
                        enable = true,
                        command = "clippy",
                    },
                },
            },
        },
    })
end

lvim.plugins = {
    {
        "ggandor/leap.nvim",
        name = "leap",
        config = function()
            require("leap").add_default_mappings()
        end,
    },

    -- {
    --     "simrat39/rust-tools.nvim",
    --     ft = "rust",
    --     opts = RUST,
    -- },


    "Exafunction/codeium.vim",
}
