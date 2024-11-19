{ ... }:

{
  plugins.floaterm = {
    enable = true;
    autoclose = 2;
    autoinsert = true;
    shell = "zsh";
    keymaps = {
      new = "<leader>tn";
      kill = "<leader>tk";
      hide = "<leader>th";
      show = "<leader>ts";
    };
  };
}
