{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    dotnet = with pkgs.dotnetCorePackages; combinePackages [sdk_6_0 sdk_8_0];
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      DOTNET_CLI_HOME = "/tmp";
      buildInputs = [dotnet];
    };
  };
}
