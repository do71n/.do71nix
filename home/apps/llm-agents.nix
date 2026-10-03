{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.llm-agents.packages.${pkgs.system}.opencode2
    inputs."claude-desktop".packages.${pkgs.system}.claude-desktop-fhs
    pkgs.pi-coding-agent
  ];

  # OpenCode JSON config
  xdg.configFile."opencode/opencode.jsonc".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";

    plugin = [
      # "opencode-dir"
    ];

    provider = {
      "opencode-go" = {
        options = {
          baseURL = "https://opencode.binnieshkdigital.com/v1";
        };
      };
    };

    mcp = {
      codegraph = {
        type = "local";
        command = [
          "codegraph"
          "serve"
          "--mcp"
        ];
      };

      nixos = {
        type = "local";
        command = [
          "uvx"
          "mcp-nixos"
        ];
      };
    };
  };
}
