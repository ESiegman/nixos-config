{ ... }:

{
  programs.autoclose = {
    enable = true;
    keys = {
      "(" = { escape = false; close = true; pair = "()"; };
      "[" = { escape = false; close = true; pair = "[]"; };
      "{" = { escape = false; close = true; pair = "{}"; };
      "\"" = { escape = true; close = true; pair = "\"\""; };
      "'" = { escape = true; close = true; pair = "''"; };
    };
  };
}
