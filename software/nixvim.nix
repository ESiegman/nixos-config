{ ... }:

{
  programs.nixvim = {
    enable = true;

    clipboard.providers.wl-copy.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      wrap = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      termguicolors = true;
      cursorline = true;
      scrolloff = 7;
      sidescrolloff = 7;
      };
      globals = {
        mapleader = " ";
      };
    
      keymaps = [
      {
        action = ":Neotree close<CR>";
        key = "<M-r>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":Neotree<CR>";
        key = "<M-e>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":tabnew<CR>";
        key = "<M-t>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":bdelete<CR>";
        key = "<M-w>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":tabnext<CR>";
        key = "<M-Right>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":tabprevious<CR>";
        key = "<M-Left>";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];
    colorschemes.nightfox = {
      enable = true;
      flavor = "carbonfox";
      settings.options = {
        transparent = true;
      };
    };

    imports = [
      ./nvim-plugins/autoclose.nix
      ./nvim-plugins/avante.nix
      ./nvim-plugins/baleia.nix
      ./nvim-plugins/bufferline.nix
      ./nvim-plugins/ccc.nix
      ./nvim-plugins/cmp-bufferline.nix
      ./nvim-plugins/cmp-calc.nix
      ./nvim-plugins/cmp.nix
      ./nvim-plugins/comment-box.nix
      ./nvim-plugins/competitest.nix
      ./nvim-plugins/compiler.nix
      ./nvim-plugins/conform.nix
      ./nvim-plugins/copilot.nix
      ./nvim-plugins/cursorline.nix
      ./nvim-plugins/dashboard.nix
      ./nvim-plugins/debugprint.nix
      ./nvim-plugins/floaterm.nix
      ./nvim-plugins/hmts.nix
      ./nvim-plugins/illuminate.nix
      ./nvim-plugins/image.nix
      ./nvim-plugins/indent-blankline.nix
      ./nvim-plugins/lspkind.nix
      ./nvim-plugins/lsp-lines.nix
      ./nvim-plugins/lsp.nix
      ./nvim-plugins/lspsaga.nix
      ./nvim-plugins/lsp-signature.nix
      ./nvim-plugins/lualine.nix
      ./nvim-plugins/markview.nix
      ./nvim-plugins/navic.nix
      ./nvim-plugins/neocord.nix
      ./nvim-plugins/neogen.nix
      ./nvim-plugins/neotree.nix
      ./nvim-plugins/nix.nix
      ./nvim-plugins/noice.nix
      ./nvim-plugins/notify.nix
      ./nvim-plugins/nui.nix
      ./nvim-plugins/scrollview.nix
      ./nvim-plugins/telescope.nix
      ./nvim-plugins/treesitter.nix
      ./nvim-plugins/ufo.nix
      ./nvim-plugins/web-devicons.nix
      ./nvim-plugins/whichkey.nix
      ./nvim-plugins/wilder.nix
      ./nvim-plugins/vimtex.nix
      ./nvim-plugins/yazi.nix
    ];
  };
}
