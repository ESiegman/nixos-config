{ ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion = true;
      enableCompletion = true;
      autocd = true;
      dotDir = ".config/zsh";

      shellAliases = {
        grep = "grep --color=auto";
        chrome = "chromium";
        teams = "teams-for-linux";
        discord = "vesktop";
        cat = "bat";
        buildsys = "sudo nixos-rebuild switch --flake /etc/nixos#";
        fastfetch = "fastfetch --logo ~/.config/fastfetch/fastfetch.png --logo-height 21";
      };
      initExtraFirst = ''
        export XDG_DATA_HOME="$HOME/.local/share"
        mkdir -p ~/.local/share/applications
        sed 's/^Exec=/&nvidia-offload /' /run/current-system/sw/share/applications/steam.desktop > ~/.local/share/applications/steam.desktop

        # Install external plugins manually if not present
        function install_plugin {
          local plugin=$1
          local repo=$2
          if [ ! -d "$ZSH/custom/plugins/$plugin" ]; then
            git clone --depth=1 $repo $ZSH/custom/plugins/$plugin
          fi
        }

        install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
        install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
        install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions.git"
        install_plugin "zsh-history-substring-search" "https://github.com/zsh-users/zsh-history-substring-search.git"
        install_plugin "you-should-use" "https://github.com/MichaelAquilina/zsh-you-should-use.git"
        install_plugin "fzf-tab" "https://github.com/Aloxaf/fzf-tab.git"
        install_plugin "alias-tips" "https://github.com/djui/alias-tips.git"
        install_plugin "zsh-z" "https://github.com/agkozak/zsh-z.git"

      '';
      initExtra = ''
        # Function to connect/disconnect to VPN
        function vpn {
          if sudo wg show wgnord 2>/dev/null | grep -q 'interface: wgnord'; then
            echo "You are currently connected to VPN."
            read -p "Do you want to disconnect? (y/n): " choice
            if [[ $choice == "y" ]]; then
              sudo wgnord d
              fi
            else
              echo "You are currently not connected to VPN."
              read -p "Do you want to connect? (y/n): " choice
            if [[ $choice == "y" ]]; then
              read -p "Enter the location to connect: " location
              sudo wgnord c $location
            fi
          fi
        }

        # Functions to run MATLAB 
        function run-matlab-file {
          if [ -z "$1" ]; then
            echo "Please provide the MATLAB script file (.m) to run."
            return 1
          fi
                    
          local directory=$(pwd)
          local script_file="$1"
          local location="$directory/$script_file"
                
          cp "$location" ~/MATLAB
          cd ~/MATLAB/bin
          nix run gitlab:doronbehar/nix-matlab#matlab-shell
          ./matlab -nosplash -nodesktop -r "run('$script_file');"
            cd "$directory"
        }
        function run-matlab-cli {
          nix run gitlab:doronbehar/nix-matlab#matlab-shell
          cd ~/MATLAB/bin
          ./matlab -nodisplay -nosplash -nodesktop
        }
        function matlab {
          nix run gitlab:doronbehar/nix-matlab#matlab-shell
          cd ~/MATLAB/bin
          ./matlab
        }
        fastfetch
      '';
    };
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [
        "git"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "zsh-completions"
        "zsh-history-substring-search"
        "you-should-use"
        "fzf-tab"
        "alias-tips"
        "zsh-z"
      ];
    };
    eza = {
      enable = true;
      icons = true;
    };
    fzf.enable = true;
    bat.enable = true;
    fd = {
      enable = true;
      hidden = true;
    };
  };
}
