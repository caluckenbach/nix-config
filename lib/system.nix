inputs: self: super: let
  inherit (self) attrValues filter getAttrFromPath hasAttrByPath collectNix;

  modulesCommon = collectNix ../modules/common;
  modulesLinux  = collectNix ../modules/linux;
  modulesDarwin = collectNix ../modules/darwin;

  homeCommon = collectNix ../home/common;
  homeLinux  = collectNix ../home/linux;
  homeDarwin = collectNix ../home/darwin;

  collectInputs = let
    inputs' = attrValues inputs;
  in path: inputs'
    |> filter (hasAttrByPath path)
    |> map (getAttrFromPath path);

  inputHomeModules   = collectInputs [ "homeModules"   "default" ];
  inputModulesLinux  = collectInputs [ "nixosModules"  "default" ];
  inputModulesDarwin = collectInputs [ "darwinModules" "default" ];

  specialArgs = inputs // {
    inherit inputs;
    lib = self;
  };

  # Overlays for additional packages
  overlays = [
    inputs.zjstatus.overlays.default
  ];
in {
  nixosSystem' = module: super.nixosSystem {
    inherit specialArgs;

    modules = [
      module

      {
        nixpkgs.overlays = overlays;
        home-manager.sharedModules = inputHomeModules ++ homeCommon ++ homeLinux;
      }
    ] ++ modulesCommon
      ++ modulesLinux
      ++ inputModulesLinux;
  };

  darwinSystem' = module: super.darwinSystem {
    inherit specialArgs;

    modules = [
      module

      {
        nixpkgs.overlays = overlays;
        home-manager.sharedModules = inputHomeModules ++ homeCommon ++ homeDarwin;
      }
    ] ++ modulesCommon
      ++ modulesDarwin
      ++ inputModulesDarwin;
  };
}
