{
  inputs,
  pkgs,
  ...
}:
let
  username = "ayato";
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "26.05";

    packages = with pkgs; [
      bat
      bottom
      delta
      eza
      exiftool
      fd
      fzf
      ffmpeg
      gh
      gcc
      gawk
      gnused
      gnupg
      git
      gibo
      ghq
      go-task
      jq
      k6
      mise
      nkf
      nixfmt
      neovim # nightly
      pinentry_mac
      qmk
      ripgrep
      starship
      tig
      tree
      tmux
      tlrc # tldr
      vim
      yazi
      yq
      yubikey-manager
      wezterm
      zoxide
    ];
  };

  programs.home-manager.enable = true;
}
