{ ... }:

{
    plugins.bufferline = {
        enable = true;
        settings.options = {
            always_show_bufferline = true;
            auto_toggle_bufferline = true;
            buffer_close_icon = "";
            close_command = "bdelete! %d";
            close_icon = "";
            color_icons = true;
            diagnostics = "nvim_lsp";
            diagnostics_update_on_event = true;
            duplicate_across_groups = true;
            enforce_regular_tabs = false;
            left_trunc_marker = "";
            max_name_length = 18;
            max_prefix_length = 15;
            mode = "buffers";
            modified_icon = "●";
        };
    };
}
