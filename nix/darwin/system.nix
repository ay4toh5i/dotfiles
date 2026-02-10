{ ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    stateVersion = 6;
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";

        # keyboard
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        ApplePressAndHoldEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = true;
        NSAutomaticCapitalizationEnabled = true;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticDashSubstitutionEnabled = true;
        NSAutomaticQuoteSubstitutionEnabled = true;

        # trackpad
        "com.apple.mouse.tapBehavior" = 1; # Configures the trackpad tap behavior. Mode 1 enables tap to click.

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
        showMissionControlGestureEnabled = true;
      };
      trackpad = {
        Clicking = true;
        Dragging = true;
        DragLock = false;
        TrackpadThreeFingerDrag = false; # Disable three-finger drag
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
