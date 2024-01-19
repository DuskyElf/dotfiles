{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.nixvim.nixosModules.nixvim ];

  # dependencies
  environment.systemPackages = with pkgs; [ ripgrep ];

  stylix.fonts.monospace = {
    name = "Jet Brains Mono Nerd";
    package = pkgs.udev-gothic-nf;
  };

  programs.nixvim = {
    enable = true;

    clipboard.providers.wl-copy.enable = true;

    globals = { mapleader = " "; };

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      wrap = true;
    };

    keymaps = [
      {
        key = "<leader>e";
        action = ":Neotree toggle<CR>";
        options.desc = "Explorer";
      }
      {
        key = "<leader>h";
        action = ":nohl<CR>";
        options.desc = "No highlight";
      }
      {
        key = "kj";
        mode = [ "i" ];
        action = "<esc>";
        options.desc = "Normal Mode";
      }
    ];

    plugins = {
      which-key = {
        enable = true;
        registrations = {
          "<leader>f" = "+fuzzy find";

          "<leader>l" = "+lsp";
          "<leader>lj" = "Next diagnostic";
          "<leader>lk" = "Prev diagnostic";
          "<leader>lr" = "Rename symbol";
          "<leader>ld" = "Goto definition";
          "<leader>la" = "Code Action";
          "<leader>lf" = "Format";
        };
      };

      nvim-autopairs.enable = true;

      nvim-cmp = {
        enable = true;
        completion.autocomplete = [ "TextChanged" ];

        snippet.expand = {
          __raw = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      luasnip.enable = true;
      cmp-nvim-lsp.enable = true;

      lualine = {
        enable = true;
        theme = "dracula";
      };

      lsp = {
        enable = true;

        servers = { nil_ls.enable = true; };

        keymaps = {
          diagnostic = {
            "<leader>lj" = "goto_next";
            "<leader>lk" = "goto_prev";
          };

          lspBuf = {
            K = "hover";
            "<leader>lr" = "rename";
            "<leader>ld" = "definition";
            "<leader>la" = "code_action";
            "<leader>lf" = "format";
          };
        };
      };

      none-ls = {
        enable = true;

        sources.formatting = {
          stylua.enable = true;
          nixfmt.enable = true;
        };
      };

      telescope = {
        enable = true;

        keymaps = {
          "<leader>ff" = {
            action = "git_files";
            desc = "Fuzzy find files";
          };
          "<leader>fg" = {
            action = "live_grep";
            desc = "Live grep";
          };
          "<leader>d" = {
            action = "lsp_workspace_symbols";
            desc = "Goto workspace symbol";
          };
          "<leader>g" = {
            action = "lsp_document_symbols";
            desc = "Goto document symbol";
          };
        };
      };

      treesitter = {
        enable = true;

        indent = true;
        nixvimInjections = true;
      };

      neo-tree = {
        enable = true;
        autoCleanAfterSessionRestore = true;
      };
    };
  };
}
