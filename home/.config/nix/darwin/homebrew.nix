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
      "qmk/qmk"
      "sanemat/font"
    ];

    brews = [
      "pinentry-mac"
      "qmk/qmk/qmk"
    ];

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
      "ghostty"
      "google-chrome"
      "jordanbaird-ice@beta"
      "keycastr"
      "multipass"
      "raycast"
      "rectangle-pro"
      "spotify"
      "tableplus"
      "visual-studio-code"
      "zoom"
    ];
  };
}
