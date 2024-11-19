{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;
      autocd = true;
      dotDir = ".config/zsh";

      shellAliases = {
        grep = "grep --color=auto";
        chrome = "chromium";
        teams = "teams-for-linux";
        discord = "vesktop";
        cat = "bat";
        buildsys = "sudo nixos-rebuild switch --flake .#nixos --impure";
        fastfetch = "fastfetch --logo ~/.config/fastfetch/fastfetch.png --logo-height 21";
      };
      initExtraFirst = ''
        export XDG_DATA_HOME="$HOME/.local/share"
        mkdir -p ~/.local/share/applications
        sed 's/^Exec=/&nvidia-offload /' /run/current-system/sw/share/applications/steam.desktop > ~/.local/share/applications/steam.desktop
      '';
      initExtra = ''
        source ~/.p10k.zsh
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

        # Function to setup and/or enter virtual Python environment
        function virt_env {
          if [[ -n "$VIRTUAL_ENV" ]]; then
            deactivate
          else
            if [ ! -d "./venv" ]; then
              python -m venv venv
            fi
            source ./venv/bin/activate
          fi
        }

        fastfetch --logo ~/.config/fastfetch/fastfetch.png --logo-height 21
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
        ];
      };
      plugins = [
        {name = "powerlevel10k";src = pkgs.zsh-powerlevel10k;file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";}
      ];
    };
  };
}
