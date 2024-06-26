{ pkgs, unstable,inputs,system, ... }:

let
    upkgs = with unstable; [
    ## Tools
    air
    biome
    hugo
    helix
    lsof
    fastfetch
    go-swag
    protobuf_25
    tailwindcss
    templ

    ## Db
    tigerbeetle

    ## Runtimes
    bun

    ##LANGUAGES
    cbqn-replxx
    erlang_26
    factor-lang
    gleam
    
    ##go
    go_1_22
    gopls
    ##
    
    hare
    jelly
    nim-unwrapped-2
    php
    uiua
    unison-ucm
    zig
    ##LANGUAGES

    ## LSP
    dockerfile-language-server-nodejs
    emmet-language-server
    lua-language-server
    nimlsp
    nil
    nimlangserver
    nixpkgs-fmt
    nodePackages.typescript-language-server
    marksman
    tailwindcss-language-server
    typescript
    taplo
    vscode-langservers-extracted
    yaml-language-server
    zls 
  ];
inherit system;

in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    homeDirectory = "/home/prince";
    stateVersion = "23.11";
    username = "prince";
    packages = with pkgs; [
      # CLI Tools
      awscli2
      awsebcli
      bat
      bash
      butane
      cmake
      cfssl
      coreutils-full
      darcs
      fd
      fish
      gnumake
      gnupatch
      gzip
      htop
      jq
      lazygit
      lsd
      mercurial
      mariadb
      neovim
      openssh
      openssl
      parallel
      ##Podman
      podman
      podman-compose
      podman-desktop
      ##
      ripgrep
      rsync
      sshs
      starship
      tealdeer
      traceroute
      tree-sitter
      unzip
      wget
      wl-clipboard
      yarn
      zip
      zoxide

      # Programming languages
      ghc
      gforth
      io
      
      ## janet
      janet
      jpm
      ##
      
      ## lua
      lua
      luarocks
      ##
      
      mercury
      
      ## Ocaml
      ocaml
      opam
      ##
      
      perl
      
      ## python
      python311
      python311Packages.pip
      python311Packages.ruff-lsp
      python311Packages.python-lsp-server
      ##
      
      racket
      rakudo
      rustup
      
           
      # Runtimes
      nodejs_21
      wasmtime
    
      # Build Tools
      #clang-tools
      nix-ld
      glibc
      libclang
      gfortran
      git
      lldb
    
      #Fonts
      fantasque-sans-mono
      hack-font
      julia-mono
      redhat-official-fonts

      #LSP
      inputs.bqnlsp.packages.${system}.lsp 
     
   ] ++  upkgs;
  };

  home.file = {
    ".config/fish/config.fish".source = dotfiles/fish/config.fish;
    ".config/starship.toml".source = dotfiles/starship.toml;
    ".config/helix/languages.toml".source = dotfiles/helix/languages.toml;
    ".config/helix/config.toml".source = dotfiles/helix/config.toml;
    ".config/wezterm/wezterm.lua".source = dotfiles/wezterm/wezterm.lua;
    ".config/fastfetch/config.conf".source = dotfiles/fastfetch/config.conf;
  };

home.sessionVariables = {
    EDITOR = "hx";
  };
  
  ## Custom programs config
   programs.git = {
    enable = true;
    userName = "Prince Junior Mguni";
    userEmail = "princem@bestforu.co.za";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      safe = {
        directory = "/etc/nixos";
      };
    };
  };
     # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
