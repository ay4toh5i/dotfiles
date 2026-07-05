{ ... }:
{
  # ⚠ switch 前に Zen を閉じること（セッションファイルへの排他アクセスが必要）
  # profiles.default.pinsForceAction = "remove"; # "demote" で通常タブに降格
  programs.zen-browser.profiles.default.pinsForce = false;
  programs.zen-browser.profiles.default.pins = let
    pins = {
      "Private" = {
        id = "ee391d09-dd4e-4a64-99a2-214180691a90";
        isGroup = true;
        isFolderCollapsed = true;
        editedTitle = true;
        position = 100;
      };
      "Amazon" = {
        id = "729a78ec-1d9e-47c5-83ec-d84f207c0649";
        url = "https://www.amazon.co.jp/";
        folderParentId = pins."Private".id;
        isEssential = true;
        position = 101;
      };
      "Prime Video" = {
        id = "d87824e9-754c-435a-a02b-1bac0c06cd87";
        url = "https://www.amazon.co.jp/Amazon-Video";
        folderParentId = pins."Private".id;
        isEssential = true;
        position = 102;
      };
      "GIGAZINE" = {
        id = "67a5f14e-bd1f-4629-a688-59392348db36";
        url = "https://gigazine.net/";
        folderParentId = pins."Private".id;
        position = 103;
      };
      "日本経済新聞" = {
        id = "59d1b1a1-0241-42e8-9491-df57f5e18709";
        url = "https://www.nikkei.com/";
        folderParentId = pins."Private".id;
        position = 104;
      };
      "Google ニュース" = {
        id = "81588aca-bdf9-4514-a736-73c43d13fe9d";
        url = "https://news.google.com/home?hl=ja&gl=JP&ceid=JP:ja";
        folderParentId = pins."Private".id;
        position = 105;
      };
      "Following — Bluesky" = {
        id = "e6062f19-4ef5-425e-b5b5-b2762b4cddae";
        url = "https://bsky.app/";
        folderParentId = pins."Private".id;
        position = 106;
      };
      "ｺｯｶﾗSaaS" = {
        id = "60c6eecb-03aa-4ee0-a690-12240a8ad465";
        url = "https://tamuramble.theletter.jp";
        folderParentId = pins."Private".id;
        position = 107;
      };
      "The Verge" = {
        id = "93f339c5-80c5-42bf-97aa-58a124bd0fe9";
        url = "https://www.theverge.com";
        folderParentId = pins."Private".id;
        position = 108;
      };
      "サウンドハウス" = {
        id = "5fe180a1-4af7-443f-8518-d816a8f27344";
        url = "https://www.soundhouse.co.jp/";
        folderParentId = pins."Private".id;
        position = 109;
      };
    };
  in pins;
}
