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
      {
        name = "yksr-melt/Meltype";
        clone_target = "https://github.com/yksr-melt/Meltype.git";
      }
    ];

    brews = [
      "crit"
      "duckdb"
      "herdr"
      "ollama"
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
      "karabiner-elements"
      "keycastr"
      "macskk"
      "postman"
      "raycast"
      "rectangle-pro"
      "secretive"
      "spotify"
      "tableplus"
      "thaw@beta"
      "yksr-melt/Meltype/meltype"
      "zoom"
    ];
  };
}
