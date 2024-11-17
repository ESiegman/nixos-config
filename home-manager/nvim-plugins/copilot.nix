{ ... }:

{
    plugins.copilot-lua = {
      enable = true;
      suggestion = {
            enable = true;
            auto_trigger = true;
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
