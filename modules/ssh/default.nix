{ pkgs }:

pkgs.symlinkJoin {
  name = "ssh-deps";
  paths = with pkgs; [
    openssh
    git       # git required in ssh config
  ];
}
