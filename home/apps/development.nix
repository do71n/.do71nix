{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Compilers
    quickshell
    arduino-cli
    gcc
    gnumake
    binutils
    pkg-config
    gdb
    go
    python3
    nodejs
    zig

    # Build systems
    meson
    ninja
    cmake
    autoconf
    automake
    bison
    flex
    gettext
    libtool
    patch

    # Libraries / Tools
    nlohmann_json
    stb
    qpdf
    cppcheck
    tuicr
    rustup
    tree-sitter

    # Documentation
    man-db
    man-pages

    # Package managers
    luarocks
    uv
  ];
}
