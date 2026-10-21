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
      {
        name = "arto-app/tap";
        trusted = true;
      }
    ];

    brews = [
      "crit"
      "duckdb"
      "herdr"
    ];

    casks = [
      "alt-tab"
      "android-studio"
      "arc"
      "arto"
      "chatgpt"
      "cleanshot"
      "claude"
      "font-0xproto-nerd-font"
      "font-hackgen-nerd"
      "font-plemol-jp-nf"
      "font-udev-gothic-nf"
      "font-moralerspace"
      "font-symbols-only-nerd-font"
      "gitify"
      "ghostty"
      "google-chrome"
      "homerow"
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
      "thebrowsercompany-dia"
      "zoom"
    ];
  };
}
