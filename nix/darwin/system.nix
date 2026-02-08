{ ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    stateVersion = 6;
    primaryUser = "ayato";
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";

        # keyboard
        KeyRepeat = 2;
        InitialKeyRepeat = 12;
        ApplePressAndHoldEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = true;
        NSAutomaticCapitalizationEnabled = true;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticDashSubstitutionEnabled = true;
        NSAutomaticQuoteSubstitutionEnabled = true;

        # scroll
        AppleScrollerPagingBehavior = true;
      };
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        ShowStatusBar = true;
        ShowPathbar = true;
        ShowHardDrivesOnDesktop = false;
        ShowExternalHardDrivesOnDesktop = false;
        ShowRemovableMediaOnDesktop = true;
        ShowMountedServersOnDesktop = false;
        NewWindowTarget = "Home";
      };
      dock = {
        autohide = true;
        show-recents = false;
        orientation = "left";
        magnification = true;
      };
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
        TrackpadTwoFingerDoubleTapGesture = true;
        TrackpadRightClick = true;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
