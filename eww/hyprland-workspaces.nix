{ pkgs, rustPlatform, config, fetchFromGitHub, lib, ... } : 
rustPlatform.buildRustPackage rec {
  pname = "hyprland-workspaces";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "FieldofClay";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-4QGLTimIpx74gWUyHCheUZZT1WgVzBoJRY8OlUDdOh4=";
  };

  cargoHash = "sha256-9ndP0nyRBCdOGth4UWA263IvjbgnVW2x9PK8oTaMrxg=";

  nativeBuildInputs = with pkgs; [
    cargo
    rustPlatform.cargoSetupHook
    rustc
  ];
}
