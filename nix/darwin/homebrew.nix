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
    ];

    brews = [];

    casks = [
      "alt-tab"
      "arc"
      "chatgpt"
      "cleanshot"
      "claude"
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
      "multipass"
      "postman"
      "raycast"
      "rectangle-pro"
      "spotify"
      "tableplus"
      "visual-studio-code"
      "zoom"
    ];
  };
}
