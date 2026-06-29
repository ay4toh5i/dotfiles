{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      "homebrew/bundle"
      "sanemat/font"
      "arto-app/tap"
    ];

    brews = [];

    casks = [
      "alt-tab"
      "arc"
      "arto"
      "chatgpt"
      "cleanshot"
      "claude"
      "duckdb"
      "font-0xproto-nerd-font"
      "font-hackgen-nerd"
      "font-plemol-jp-nf"
      "font-symbols-only-nerd-font"
      "gitify"
      "ghostty"
      "google-chrome"
      "jordanbaird-ice@beta"
      "karabiner-elements"
      "keycastr"
      "macskk"
      "postman"
      "raycast"
      "rectangle-pro"
      "secretive"
      "spotify"
      "tableplus"
      "zoom"
    ];
  };
}
