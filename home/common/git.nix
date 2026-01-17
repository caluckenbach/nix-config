{ lib, ... }: let
  inherit (lib) enabled;
in {
  programs.git = enabled {
    settings = {
      user.name  = "Constantin Luckenbach";
      user.email = "cluckenbach@protonmail.com";

      init.defaultBranch   = "main";
      push.autoSetupRemote = true;
      pull.rebase          = true;
    };
  };

  programs.jujutsu = enabled {};

  programs.difftastic = enabled {
    git.enable = true;
  };
}
