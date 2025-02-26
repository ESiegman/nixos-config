{ ... }:

{
  vim = {
    
    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      python.enable = true;
      ts.enable = true;
      clang.enable = true;
      java.enable = true;
    };
  };
}
