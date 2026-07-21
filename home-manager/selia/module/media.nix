{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    graphicsmagick
    imagemagick
    libraw

    typst
    pandoc
    marp-cli
  ];
}
