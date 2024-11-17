{ ... }:

{
  plugins.floaterm = {
    enable = true;
    autoclose = true;
    autoinsert = true;
    shell = "zsh";
    keymap = {
      new = "<leader>tn";
      kill = "<leader>tk";
      hide = "<leader>th";
      show = "<leader>ts";
    };
  };
}
