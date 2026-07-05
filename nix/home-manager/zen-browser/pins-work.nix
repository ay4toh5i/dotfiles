{ ... }:
{
  programs.zen-browser.profiles.default.search.default = "google";

  # ⚠ switch 前に Zen を閉じること（セッションファイルへの排他アクセスが必要）
  # programs.zen-browser.profiles.default.pinsForce = false;
  # programs.zen-browser.profiles.default.pins = let
  #   pins = {
  #     "Example" = {
  #       id = "00000000-0000-0000-0000-000000000001";
  #       url = "https://example.com";
  #       position = 100;
  #     };
  #   };
  # in pins;
}
