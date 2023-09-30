{ pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.tomreadcutting = {
    isNormalUser = true;
    home = "/home/tomreadcutting";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    initialPassword = "nixos";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJgH+qYTtIhfx2eKvBh0sEnuQGSZe6SdaZ+rZMXhsfC72JAV44BQ5BPXAPOwH9GXnObRHWipT++XpFetPDSC/snaFtu/JoynChWBwpD2wFZ/FfjjufTtM7DhKKSWzvFLEnnMOSG6DZ2ZptU5mV+zCuh9uakk+dkw7Ci6DydgDFiuBOixofQXHGGC0V/AeaNTl1QtSkQjrSfXS6TtD3ksL+i0X3XwEanQBZKIZ1XbXgj3YEjtmdP9StG9mcl5FA+SXqbbozI6YSczD42T7HzHYBYSEPaQFewTxzULwvjB8jX5DalQ1J2BZaF91WPAsSzXybiNly+ZAjltzRIkJvtppdT6wbfPoaopRvNTFty9MeajLhMvy/80Mhy3roV04SELeIezFzU9znCoUhclQm/vXmiB1V8bSDSREKFlCMo5Fk5Byyf3Z7b+pr9ItUJyi8G2YUIzhmPZEAytwJzCrIYps2hOQ295wHWSxFXrxmAITYtcHWWN4ywpkWupJOBbvg1288PJeChuKHO0RqdrWwQgShVWGqul5Bv8O/nWoKqzZhrrbw9GS7LT9OWXAhcQpItUpz6ysPLdl34KGZWymsvELfNr0/utCZp/yDK9pYFxVYAtqrdpW8ueADoLsW6RexMo8Badpa2dyFRFRi++UKW3Tl7+TR7qfk1dS0HQtb8OIPyQ== readcuttingt@gmail.com"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
