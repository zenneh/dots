
{ pkgs, rustPlatform, config, fetchFromGitHub, lib, ... } : 
rustPlatform.buildRustPackage rec {
  pname = "wezterm";
  version = "20240203-110809-5046fc22";

  src = fetchFromGitHub {
    owner = "wez";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-hhuzs89wWKc7n6HMKriWvV+pLhfLvO06XRWtmdCQ0rs=";
  };

  cargoHash = "sha256-ggdP0nyRBCdOGth4UWA263IvjbgnVW2x9PK8oTaMrxg=";

  nativeBuildInputs = with pkgs; [
    cargo
    rustPlatform.cargoSetupHook
    rustc
  ];
}
