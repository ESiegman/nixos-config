{ ... }:

{
    plugins.conform-nvim = {
        enable = true;
        settings = {
            formatter_by_ft = {
                python = [ "isort" "black" ];
                c = [ "clang-format" ];
                cpp = [ "clang-format" ];
                java = [ "prettier" ];
                lua = [ "stylua" ];
                sh = [ "shfmt" ];
                nix = [ "nixpkgs_fmt" ];
                javascript = [ "prettier" ];
                typescript = [ "prettier" ];
                json = [ "jq" ];
                html = [ "prettier" ];
                css = [ "prettier" ];
                markdown = [ "prettier" ];
            };
        };
    };
}
