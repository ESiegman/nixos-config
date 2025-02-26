{ ... }:

{
  plugins.lsp = {
    enable = true;
    servers = {
      pyright.enable = true;
      clangd.enable = true;
      ts_ls.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      bashls.enable = true;
      jdtls.enable = true;
      html.enable = true;
      cssls.enable = true;
      jsonls.enable = true;
      nil_ls.enable = true;
      lua_ls.enable = true;
      ltex.enable = true;
    };
  };
}
