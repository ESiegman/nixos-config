{ ... }:

{
    plugins.copilot-lua = {
      enable = true;
      suggestion = {
            autoTrigger = true;
            debounce = 75;
            keymap = {
                accept = "<M-l>";
                next = "<M-]>";
                prev = "<M-[>";
                dismiss = "<C-]>";
            };
        };
    };
}
