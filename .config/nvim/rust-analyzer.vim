" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- Next for C++
nvim_lsp.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}

-- Next for Rust
local opts = {
        tools = {
                autoSetHints = true,
                runnables = {
                        use_telescope = true
                        },
                inlay_hints = {
                        show_parameter_hints = false,
                        parameter_hints_prefix = "",
                        other_hints_prefix = "",
                        },
                },

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		-- on_attach = on_attach,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
                                --cargo = {
                                --        runBuildScripts = false
                                --        },
                                --
                                procMacro = {
                                        enable = true
                                        },
                                cargo = {
                                    runBuildScripts = false
                                },
				--enable clippy on save
				checkOnSave = {
					command = "clippy",
                                        --overrideCommand = { "./x.py", "check", "--json-output"}
					}
				}
			}
		},
	}

require('rust-tools').setup(opts)
EOF
