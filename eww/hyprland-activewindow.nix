{ pkgs, rustPlatform, config, fetchFromGitHub, lib, ... } : 
rustPlatform.buildRustPackage rec {
  pname = "hyprland-activewindow";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "FieldofClay";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-8pzm8uIyvlz4nHbxtmbMblFIj38M2VsenaKzJ9di1Do=";
  };

  cargoHash = "sha256-wIF0qa1dyZlcsLPL2TflFQFPm4Pe9TWHe1F2L1YccZ8=";

  nativeBuildInputs = with pkgs; [
    cargo
    rustPlatform.cargoSetupHook
    rustc
  ];
}
