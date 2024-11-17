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
        desc = "Live Grep";
        action = "live_grep";
        options = {
          noremap = true;
          silent = true;
        };
      };
      "<leader>fb" = {
        desc = "Buffers";
        action = "buffers";
        options = {
          noremap = true;
          silent = true;
        };
      };
      "<leader>fh" = {
        desc = "Help Tags";
        action = "help_tags";
        options = {
          noremap = true;
          silent = true;
        };
      };

    };
  };
}
