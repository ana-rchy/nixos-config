{ pkgs, lib, ... }:

{
  programs.neovim.enable = true;
  programs.nvf.enable = true;

  programs.nvf.settings.vim = {
    languages = {
      enableTreesitter = true;
      enableDAP = true;
      enableExtraDiagnostics = true;

      clang.enable = true;
      csharp = {
        enable = true;
        lsp.enable = true;
        lsp.server = "omnisharp";
      };
      nix.enable = true;
      rust.enable = true;
    };
    
    lsp = {
      enable = true;
      
      mappings = {
        renameSymbol = "<leader>rn";
      };
    };

    searchCase = "smart";
    
    options = {
      tabstop = 4;
      shiftwidth = 0;
      expandtab = true;

      number = true;
      relativenumber = false;

      clipboard = "unnamedplus";
      
      tm = 2000;
    };
    
    autopairs.nvim-autopairs = {
      enable = true;
      
      setupOpts = {
        enable_check_bracket_line = true;
        ignored_next_char = "[%w%._]";
      };
    };

    mini = {
      comment.enable = true;
      move.enable = true;
      # pairs.enable = true;
      splitjoin.enable = true;
      surround.enable = true;

      basics.enable = true;
      bracketed.enable = true;
      clue.enable = true;
      files = {
        enable = true;

        setupOpts.mappings = {
          go_in = "<Right>";
          go_in_plus = "<S-Right>";
          go_out = "<Left>";
          go_out_plus = "<S-Left>";
        };
      };
      jump.enable = true;
      jump2d.enable = true;
      misc.enable = true;

      hipatterns = {
        enable = true;
        setupOpts = {
          highlighters = lib.generators.mkLuaInline ''{
            fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
            todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
            note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
          }'';
        };
      };
    };
    
    autocomplete.blink-cmp = {
      enable = true;
      
      setupOpts.completion.documentation = {
        auto_show = true;
        auto_show_delay_ms = 200;
      };
      
      mappings = {
        scrollDocsUp = "<C-Up>";
        scrollDocsDown = "<C-Down>";
      };
    };
    
    diagnostics = {
      enable = true;
      
      config = {
        virtual_lines = true;
      };
    };

    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };

    visuals = {
      fidget-nvim.enable = true;
      nvim-web-devicons.enable = true;
    };

    statusline = {
      lualine = {
        enable = true;

        refresh.statusline = 100;

        setupOpts.options.theme = {
          normal.a = {
            bg = "#5868da";
            fg = "#170007";
            gui = "bold";
          };
          normal.b = {
            bg = "#2e44b4";
            fg = "#e2e8ff";
          };
          normal.c = {
            bg = "#192772";
            fg = "#e2e8ff";
          };
          
          visual.a = {
            bg = "#9670e8";
            fg = "#170007";
            gui = "bold";
          };
          visual.b = {
            bg = "#765ad2";
            fg = "#efe9fc";
          };
          visual.c = {
            bg = "#5645bb";
            fg = "#efe9fc";
          };

          insert.a = {
            bg = "#e65d72";
            fg = "#170007";
            gui = "bold";
          };
          insert.b = {
            bg = "#ca444e";
            fg = "#feebec";
          };
          insert.c = {
            bg = "#ae292a";
            fg = "#feebec";
          };

          replace.a = {
            bg = "#e66046";
            fg = "#170007";
            gui = "bold";
          };
          replace.b = {
            bg = "#cc433d";
            fg = "#feebec";
          };
          replace.c = {
            bg = "#b02439";
            fg = "#feebec";
          };

          command.a = {
            bg = "#09aa60";
            fg = "#170007";
            gui = "bold";
          };
          command.b = {
            bg = "#0b8740";
            fg = "#e5feec";
          };
          command.c = {
            bg = "#02672a";
            fg = "#e5feec";   
          };
        };
      };
    };

    notify = {
      nvim-notify.enable = true;
    };

    git = {
      gitsigns.enable = true;
    };
    
    telescope = {
      enable = true;
      
      mappings = {
        lspDefinitions = "<leader>def";
        lspDocumentSymbols = "<leader>dsym";
        lspImplementations = "<leader>imp";
        lspReferences = "<leader>ref";
        lspTypeDefinitions = "<leader>tdef";
        lspWorkspaceSymbols = "<leader>wsym";
      };
    };

    lazy.plugins = {
      "vim-sleuth" = {
        package = pkgs.vimPlugins.vim-sleuth;
      };

      "barbar.nvim" = {
        package = pkgs.vimPlugins.barbar-nvim;

        setupModule = "barbar";

        setupOpts = {
          animation = true;
          auto_hide = 1;

          icons = {
            separator = {
              left = "▎";
              right = "▕";
            };

            current.buffer_index = false;
            inactive.buffer_index = false;
          };

          minimum_padding = 0;
        };

        after = ''
          local map = vim.api.nvim_set_keymap
          local opts = { noremap = true, silent = true }
          
          -- Move to previous/next
          map('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', opts)
          map('n', '<A-Right>', '<Cmd>BufferNext<CR>', opts)
          
          -- Re-order to previous/next
          map('n', '<A-S-Left>', '<Cmd>BufferMovePrevious<CR>', opts)
          map('n', '<A-S-Right>', '<Cmd>BufferMoveNext<CR>', opts)
          
          -- Goto buffer in position...
          map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
          map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
          map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
          map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
          map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
          map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
          map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
          map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
          map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
          map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
          
          -- Pin/unpin buffer
          map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
          
          -- Close buffer
          map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)
          
          -- Magic buffer-picking mode
          map('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
          map('n', '<C-S-p>', '<Cmd>BufferPickDelete<CR>', opts)
          
          -- Sort automatically by...
          map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
          map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
          map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
          map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
          map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
        '';
      };

      "lush.nvim" = {
        package = pkgs.vimPlugins.lush-nvim;

        after = ''
          dofile('/etc/nixos/ana/neovim/oneshot-theme.lua')
        '';
      };
    };

    luaConfigPost = ''
      local opts = { noremap = true, silent = true }

      -- swap down/up keys
      vim.keymap.set({ 'n', 'v' }, 'j', 'k', opts);
      vim.keymap.set({ 'n', 'v' }, 'k', 'j', opts);

      -- delete not cut
      vim.keymap.set({ 'v', 'n' }, 'd', '"_d', opts)
      vim.keymap.set({ 'v', 'n' }, 'x', '"_x', opts)
      vim.keymap.set({ 'v', 'n' }, '<C-d>', 'd', opts)

      -- indents when in visual mode
      vim.keymap.set('v', '<S-Tab>', '<gv', opts)
      vim.keymap.set('v', '<Tab>', '>gv', opts)

      -- open file window
      vim.api.nvim_set_keymap('n', '`', "", { callback = MiniFiles.open })
      vim.api.nvim_set_keymap('n', '<A-`>', "", { callback = MiniFiles.close })

      -- paste in insert mode
      vim.keymap.set('i', '<C-v>', '<Esc>pa', opts)

      -- dont get rid of indentation after autoindent, if you move off of the line that was indented
      vim.keymap.set('i', '<CR>', '<CR><Space><BS>')
      vim.keymap.set('n', 'o', 'o<Space><BS>')
      vim.keymap.set('n', 'O', 'O<Space><BS>')

      -- gets rid of padding between nvim window and the terminal border
      MiniMisc.setup_termbg_sync()
    '';
  };
}
