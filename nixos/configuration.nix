{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Import  generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  networking.hostName = "nixos";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "America/New_York";

  # Select internationalization properties
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  # Programs
  programs.zsh.enable = true;

  # Configure your system-wide user settings
  users.users = {
    cooper = {
      isNormalUser = true;
      description = "Cooper Miller";
      shell = pkgs.zsh;
      extraGroups = ["networkmanager" "wheel"];
    };
  };
 
  # Enable CUPS to print documents
  services.printing.enable = true; 

  # Hardware
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  }; 
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
    windowManager.qtile.enable = true;
  };
  
  # Garbage Collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete older than 7d";
  };

  # Enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  # Fonts
  fonts = {
    packages = with pkgs; [
      # nerdfonts
      noto-fonts
      noto-fonts-extra
      (nerdfonts.override {fonts = ["FiraCode"];})
    ];
    enableDefaultPackages = false;
    fontconfig.defaultFonts = {
      serif = ["FiraCode Nerd Font"];
      sansSerif = ["FiraCode Nerd Font"];
      monospace = ["FiraCode Nerd Font"];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
