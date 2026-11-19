{ ... }:

{
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      "com.apple.keyboard.fnState" = true;
      "com.apple.swipescrolldirection" = false;
      "com.apple.trackpad.forceClick" = true;
    };
    WindowManager = {
      GloballyEnabled = false;
    };
    dock = {
      autohide = true;
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      ShowPathbar = true;
      FXPreferredViewStyle = "Nlsv";
    };
    CustomUserPreferences = {
      # Screenshot
      "com.apple.screencapture" = {
        name = "screenshot";
      };
    };
  };
}
