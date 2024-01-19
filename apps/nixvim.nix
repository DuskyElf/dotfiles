{ config, pkgs, inputs, ... } :

{
    imports = [ inputs.nixvim.nixosModules.nixvim ];

    # dependencies
    environment.systemPackages = with pkgs; [
        ripgrep
    ];

    stylix.fonts.monospace = {
        name = "Jet Brains Mono Nerd";
        package = pkgs.udev-gothic-nf;
    };

    programs.nixvim = {
        enable = true;

	    clipboard.providers.wl-copy.enable = true;

        globals = {
            mapleader = " ";
        };

	    options = {
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
                options.desc = "Neotree Toggle";
            }
            {
                key = "kj";
                mode = ["i"];
                action = "<esc>";
                options.desc = "Normal Mode";
            }
        ];

        plugins = {
            which-key.enable = true;

            lualine = {
                enable = true;
                theme = "base16";
            };

            lsp = {
                enable = true;

                servers = {
                    nil_ls.enable = true;
                };
            };

            telescope = {
                enable = true;

                keymaps = {
                    "<leader>ff" = {
                        action = "git_files";
                        desc = "Telescope Git Files";
                    };
                    "<leader>fg" = {
                        action = "live_grep";
                        desc = "Telescope Live Greap";
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

    stylix.targets.nixvim.transparent_bg = {
        main = true;
        sign_column = true;
    };
}
