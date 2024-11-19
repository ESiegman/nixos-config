{ ... }:

{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options = {
          desc = "Find Files";
          noremap = true;
          silent = true;
        };
      };
      "<leader>fg" = {
        action = "live_grep";
        options = {
          desc = "Live Grep";
          noremap = true;
          silent = true;
        };
      };
      "<leader>fb" = {
        action = "bufferline";
        options = {
          desc = "Buffers";
          noremap = true;
          silent = true;
        };
      };
      "<leader>fh" = {
        action = "help_tags";
        options = {
          desc = "Help Tags";
          noremap = true;
          silent = true;
        };
      };
      };
  };
}
