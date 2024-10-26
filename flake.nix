{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		hyprland = {
			type = "git";
			url = "https://github.com/hyprwm/Hyprland";
			inputs.aquamarine.url = "github:hyprwm/aquamarine";
			submodules = true;
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixos-hardware.url = "github:NixOS/nixos-hardware/master";
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations.default = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./configuration.nix
				home-manager.nixosModules.default
				inputs.nixos-hardware.nixosModules.framework-13th-gen-intel
			];
		};
	};
}
