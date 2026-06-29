 { config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  virtualisation.virtualbox.host.enable = true;
 
   hardware.enableRedistributableFirmware = true;
   boot.kernelModules = [
                  "rtw88_pci"
                 "rtw88_8723de"
                    ];

  # Set your time zone.
   time.timeZone = "Asia/Kathmandu";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

 services.xserver.xkb.layout = "us";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
   font = "Lat2-Terminus16";
 # keyMap = "us";
   useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  programs.zsh = {
  enable = true;
  autosuggestions.enable = true;
  syntaxHighlighting.enable = true;
};

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.sandesh = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "wheel"
                     "networkManager"
                     "wireshark" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };
   
   programs.fuse.userAllowOther = true;
   programs.hyprland.enable = true;
   programs.firefox.enable = true;
   nixpkgs.config.allowUnfree = true;
   programs.waybar = {
             enable = true;
             };
  
   environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     pkgs.grim
     pkgs.qbittorrent
     pkgs.libmtp
     pkgs.foot
     pkgs.iwd
     pkgs.iw
     pkgs.virtualbox
     pkgs.nmap
     pkgs.wireshark
     pkgs.wirelesstools	
     neovim
     pkgs.aircrack-ng
     tmux
     btop
     fastfetch
     pkgs.brave
     zathura    
     git
     curl
     pkgs.python3
     liberation_ttf
     nerd-fonts.fira-code
     gcc
     pkgs.vscodium
     libreoffice
     celluloid
     pkgs.libreoffice
     waybar
     brightnessctl
     rofi
     pkgs.bleachbit
     ranger
     bibata-cursors
     wl-clipboard
     wl-clip-persist
     cliphist
     pkgs.celluloid
     pkgs.liberation_ttf
     pkgs.hyprlock
     pkgs.hypridle
     hyprpaper
     noto-fonts
     noto-fonts-color-emoji
     cantarell-fonts     
     vlc
     font-awesome
     vim
     usbutils
     simple-mtpfs
     fuse
     bluez
     corefonts    
     imv
     adwaita-icon-theme
     nerd-fonts.symbols-only
     nerd-fonts.jetbrains-mono
     pkgs.nerd-fonts.iosevka
     pavucontrol
     unzip
   ];

fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
     corefonts
      meslo-lgs-nf
];

services.mysql = {
  enable = true;
  package = pkgs.mariadb;
};

  programs.wireshark.enable = true;

  programs.dconf.enable = true;
#  fonts.fontconfig.enable = true;
  
   environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "18";
    GTK_CURSOR_THEME = "Adwaita"; 
  };

 # services.gnome.gnome-keyring.enable = true;

 # security.pam.services.login.enableGnomeKeyring = true;

  services.dbus.enable = true;
 
  hardware.bluetooth.enable = true;
 # services.blueman.enable = true; # optional GUI

 services.pipewire.enable = true;
 services.pipewire.pulse.enable = true;
 
  # Optional: if you want KDE wallet support
  # services.kwallet.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

   system.stateVersion = "25.11"; 
  }

	
