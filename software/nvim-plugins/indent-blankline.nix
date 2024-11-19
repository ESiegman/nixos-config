{ ... }:

{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      exclude = {
        filetypes = [
          "help"
          "dashboard"
          "neogitstatus"
          "neo-tree"
          "Trouble"
        ];
        buftypes = [
          "terminal"
          "nofile"
        ];
      };
      scope.enabled = false;
    };
  };
}
