{ pkgs }:

pkgs.symlinkJoin {
  name = "chezmoi-deps";
  paths = with pkgs; [
    chezmoi
  ];
}
