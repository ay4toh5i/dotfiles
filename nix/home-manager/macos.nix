{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.agent-skills.homeManagerModules.default
    ./agent-skills.nix
    ./zen-browser
  ];

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
      alacritty
      ast-grep
      bat
      bottom
      btop
      delta
      dust
      direnv
      eza
      exiftool
      fd
      fastfetch
      fzf
      ffmpeg
      gh
      gcc
      gettext
      gawk
      gnused
      gnupg
      git
      gitui
      gibo
      ghq
      gh-dash
      go-task
      qrcp # https://github.com/claudiodangelis/qrcp
      helix
      hl-log-viewer
      jnv
      jq
      k6
      macism
      mado
      (inputs.mise.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (old: {
        # The upstream macOS process-list test needs ps in the build sandbox.
        nativeCheckInputs = (old.nativeCheckInputs or [ ]) ++ [ pkgs.darwin.ps ];
      }))
      miller
      navi # https://github.com/denisidoro/navi#cheatsheet-syntax
      nh
      nkf
      nixfmt
      neovim # nightly
      omp
      onefetch
      ollama
      pinentry_mac
      postgresql
      qmk
      ripgrep
      rustup
      starship
      tig
      tree
      tmux
      tlrc # tldr
      tree-sitter
      vim
      yazi
      yq
      yubikey-manager
      wezterm
      wait4x
      witr # https://github.com/pranshuparmar/witr
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
