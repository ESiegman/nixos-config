{ ... }:

{
  programs.nixvim = {
    enable = true;

    clipboard.providers.wl-copy.enable = true;

    opt = {
      number = true;
      relativenumber = true;
      wrap = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      termguicolors = true;
      cursorline = true;
      scrolloff = 7;
      sidescrolloff = 7;
    };
    global = {
      mapleader = " ";
    };
    keymaps = [
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
      sttings.options = {
        transparent = true;
      };
    };
  };
}
