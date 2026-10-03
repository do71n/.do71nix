{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fcitx5
    fcitx5-gtk
    libsForQt5.fcitx5-qt
    qt6Packages.fcitx5-configtool
    fcitx5-rime
    fcitx5-mozc
    rime-data
  ];

  xdg.configFile."fcitx5/profile" = {
    force = true;

    text = ''
      [Groups/0]
      Name=Default
      Default Layout=eu
      DefaultIM=keyboard-eu

      [Groups/0/Items/0]
      Name=keyboard-eu

      [Groups/0/Items/1]
      Name=rime

      [Groups/0/Items/2]
      Name=mozc

      [Groups/0/Items/3]
      Name=keyboard-ru

      [GroupOrder]
      0=Default
    '';
  };

  xdg.dataFile = {
    "fcitx5/rime/default.custom.yaml" = {
      force = true;

      text = ''
        patch:
          schema_list:
            - schema: jyut6ping3
      '';
    };

    "fcitx5/rime/essay-cantonese.txt".source = ./rime-data/essay-cantonese.txt;
    "fcitx5/rime/jyut6ping3.chars.dict.yaml".source = ./rime-data/jyut6ping3.chars.dict.yaml;
    "fcitx5/rime/jyut6ping3.dict.yaml".source = ./rime-data/jyut6ping3.dict.yaml;
    "fcitx5/rime/jyut6ping3.lettered.dict.yaml".source = ./rime-data/jyut6ping3.lettered.dict.yaml;
    "fcitx5/rime/jyut6ping3.maps.dict.yaml".source = ./rime-data/jyut6ping3.maps.dict.yaml;
    "fcitx5/rime/jyut6ping3.phrase.dict.yaml".source = ./rime-data/jyut6ping3.phrase.dict.yaml;
    "fcitx5/rime/jyut6ping3.schema.yaml".source = ./rime-data/jyut6ping3.schema.yaml;
    "fcitx5/rime/jyut6ping3.words.dict.yaml".source = ./rime-data/jyut6ping3.words.dict.yaml;
    "fcitx5/rime/jyut6ping3_ipa.schema.yaml".source = ./rime-data/jyut6ping3_ipa.schema.yaml;
    "fcitx5/rime/symbols_cantonese.yaml".source = ./rime-data/symbols_cantonese.yaml;
  };
}
