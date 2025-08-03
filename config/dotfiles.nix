{...}: 
let
  dotfilesDir = builtins.path {
    path = ../dotfiles;
    name = "dotfiles";
  };

  autoDotfiles = builtins.mapAttrs (name: type: {
    source = dotfilesDir + "/${name}";
    recursive = true;
    onChange = "echo -e \"dotfile \\\"${name}\\\" changed\"";
  }) (builtins.readDir dotfilesDir);

  extraFiles = {
    "bin" = {
      source = ../bin;
      recursive = true;
    };
  };
in {

  home.file = autoDotfiles;# // extraFiles;
}
