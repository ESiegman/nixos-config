{ pkgs, ... }:

{
  plugins.vimtex = {
    enable = true;
    settings = {
      view_method = "zathura";
      compiler_method = "latexmk";
    };
    texlivePackage = pkgs.texlive.combined.scheme-full;
  };
}
