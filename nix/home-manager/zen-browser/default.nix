{ inputs, lib, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = false;

    profiles.default.search = {
      force = true;
      default = lib.mkDefault "kagi";
      engines = {
        kagi = {
          name = "Kagi";
          urls = [ { template = "https://kagi.com/search?q={searchTerms}"; } ];
          icon = "https://kagi.com/favicon.ico";
          definedAliases = [ "@k" ];
        };
      };
    };

    profiles.default.mods = [
      "72f8f48d-86b9-4487-acea-eb4977b18f21" # Better CtrlTab Panel
    ];

    policies =
      let
        mkExtensions = builtins.mapAttrs (_: slug: {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/${slug}/latest.xpi";
          installation_mode = "force_installed";
        });
      in
      {
        ExtensionSettings = mkExtensions {
          "{d634138d-c276-4fc8-924b-40a0ea21d284}" = "1password-x-password-manager";
          "{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}" = "adblock-plus";
          "jid1-93WyvpgvxzGATw@jetpack" = "to-google-translate";
          "{d0210f13-a970-4f1e-8322-0f76ec80adde}" = "instapaper-official";
          "{db8ff575-504f-4f3d-a910-07702998d21d}" = "json_formatter";
          "search@kagi.com" = "kagi-search-for-firefox";
          "amptra@keepa.com" = "keepa";
          "{ea6ccf94-00c4-4972-a28a-b9d3572b6131}" = "locale-switcher";
          "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" = "refined-github-";
          "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "styl-us";
          "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}" = "videospeed";
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = "vimium-ff";
        };
      };
  };
}
