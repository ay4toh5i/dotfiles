{
  config,
  inputs,
  pkgs,
  ...
}:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      (import ../overlays/macism.nix)
    ];
  };

  home = {
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "26.05";

    packages = with pkgs; [
      bat
      bottom
      delta
      dust
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
      macism
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

  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg"; # migrate to XDG dir:  mkdir ~/.local/share/gnupg, mv ~/.gnupg/* ~/.local/share/gnupg/
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 60;
    maxCacheTtl = 120;
    pinentry.package = pkgs.pinentry_mac;
  };
}
