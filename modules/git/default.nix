{ pkgs }:

pkgs.symlinkJoin {
  name = "git-deps";
  paths = with pkgs; [
    git
  ];
}
