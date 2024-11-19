{pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    wget
    curl
    gcc
    cmake
    clang
    python3
    nodejs
    typescript
    libstdc++
    nixpkgs-fmt
    black
    isort
    clang-tools
    google-java-format
    shfmt
    stylua
    lua-language-server
    prettierd
  ];  
}
