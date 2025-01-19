{ pkgs }:

pkgs.symlinkJoin {
  name = "rbw-deps";
  paths = with pkgs; [
    rbw   # faster bitwarden cli in rust (note that commands slightly differ)
  ];
}
