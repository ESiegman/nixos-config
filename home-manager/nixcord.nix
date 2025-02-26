{ pkgs, ... }:

{
  programs.nixcord = {
    enable = true;
    discord = {
      vencord.package = pkgs.vencord;
      vencord.enable = true;
    };
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/ESiegman/nixos-config/refs/heads/main/theme/custom.theme.css"
      ];
      frameless = true;
      plugins = {
        accountPanelServerProfile.enable = true;
        alwaysAnimate.enable = true;
        alwaysExpandRoles.enable = true;
        betterRoleContext.enable = true;
        biggerStreamPreview.enable = true;
        clearURLs.enable = true;
        copyEmojiMarkdown.enable = true;
        crashHandler.enable = true;
        fixImagesQuality.enable = true;
        messageClickActions.enable = true;
        messageLogger.enable = true;
        moreCommands.enable = true;
        moreKaomoji.enable = true;
        oneko.enable = true;
        permissionsViewer.enable = true;
        petpet.enable = true;
        platformIndicators.enable = true;
        quickReply.enable = true;
        readAllNotificationsButton.enable = true;
        relationshipNotifier.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        silentTyping.enable = true;
        spotifyControls.enable = true;
        spotifyShareCommands.enable = true;
        spotifyCrack.enable = true;
        USRBG.enable = true;
        validReply.enable = true;
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
        whoReacted.enable = true;
      };
    };
  };
}
