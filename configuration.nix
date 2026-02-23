{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "sandesh"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.sandesh = {
     isNormalUser = true;
     extraGroups = [ "wheel"
                     "networkManager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };
   programs.hyprland.enable = true;
   programs.firefox.enable = true;
   nixpkgs.config.allowUnfree = true;
   programs.waybar = {
             enable = true;
             };
  
   environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     git
     kitty
     waybar
     brightnessctl
     rofi
     htop
     ranger
     bibata-cursors
     neofetch
     pkgs.hyprlock
     pkgs.hypridle
     hyprpaper
     noto-fonts
     noto-fonts-color-emoji     
     adwaita-icon-theme
      # dejavu_fonts
     nerd-fonts.symbols-only
     vlc
     pkgs.kdePackages.dolphin
     font-awesome
     vim
     nerd-fonts.jetbrains-mono
     usbutils
     simple-mtpfs
     fuse
     bluez
     nerd-fonts.fira-code    
   ];

  programs.dconf.enable = true;
#  fonts.fontconfig.enable = true;

programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhs;
};   
 
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    fontconfig = {
      defaultFonts = {
#        monospace  = [ "JetBrainsMono Nerd Font" ];
#        sansSerif  = [ "JetBrainsMono Nerd Font" ];
#        serif      = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };


   environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
    GTK_CURSOR_THEME = "Adwaita"; 
  };
 
 hardware.bluetooth.enable = true;
 services.blueman.enable = true; # optional GUI

 services.pipewire.enable = true;
 services.pipewire.pulse.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;

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

