inputs: self: super: let
  inherit (self) attrValues filter getAttrFromPath hasAttrByPath collectNix;

  modulesCommon = collectNix ../modules/common;
  modulesLinux  = collectNix ../modules/linux;
  modulesDarwin = collectNix ../modules/darwin;

  collectInputs = let
    inputs' = attrValues inputs;
  in path: inputs'
    |> filter (hasAttrByPath path)
    |> map (getAttrFromPath path);

  inputHomeModules   = collectInputs [ "homeModules"   "default" ];
  inputModulesLinux  = collectInputs [ "nixosModules"  "default" ];
  inputModulesDarwin = collectInputs [ "darwinModules" "default" ];

  inputOverlays = collectInputs [ "overlays" "default" ];
  masterPkgs = system: import inputs.nixpkgs-master {
    inherit system;
    config.allowUnfree = true;
  };
  overlayModule = {
    nixpkgs.overlays = inputOverlays ++ [
      (final: prev: {
        zjstatus = inputs.zjstatus.packages.${prev.stdenv.hostPlatform.system}.default;
        claude-code = (masterPkgs prev.stdenv.hostPlatform.system).claude-code;
        opencode = (masterPkgs prev.stdenv.hostPlatform.system).opencode;
      })
    ];
  };

  specialArgs = inputs // {
    inherit inputs;
    lib = self;
  };
in {
  nixosSystem' = module: super.nixosSystem {
    inherit specialArgs;

    modules = [
      module
      overlayModule

      {
        home-manager.sharedModules = inputHomeModules;
      }
    ] ++ modulesCommon
      ++ modulesLinux
      ++ inputModulesLinux;
  };

  darwinSystem' = module: super.darwinSystem {
    inherit specialArgs;

    modules = [
      module
      overlayModule

      {
        home-manager.sharedModules = inputHomeModules;
      }
    ] ++ modulesCommon
      ++ modulesDarwin
      ++ inputModulesDarwin;
  };
}
