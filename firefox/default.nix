{ pkgs, config, lib, ... }:
let
  chromePath = "${config.home.homeDirectory}/dots/firefox/themes/minimal";
  # chromePath = "${config.home.homeDirectory}/nixos/home/dots/graphical/apps/firefox/themes/apatheia";
in
{
  # Example config source: https://discourse.nixos.org/t/help-setting-up-firefox-with-home-manager/23333
  programs.firefox = {
    enable = true;
    
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        FirefoxHome = {
          Search = true;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
      };
    };
    profiles = {
      default = {
        id = 0;
        name = "zenneh";
        settings = {
          "general.smoothScroll" = true;
          # source: https://github.com/PrettyCoffee/fluidity#usage
          "browser.startup.homepage" = "${config.home.homeDirectory}/dots/firefox/startpages/dawn/index.html";
        };
        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("svg.context-properties.content.enabled", true);
        '';
        userChrome = ''
          @import "${chromePath}/userContent.css";
          @import "${chromePath}/userChrome.css";
        '';
      };
    };
  };
}
