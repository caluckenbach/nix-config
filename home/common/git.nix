{ lib, ... }: let
  inherit (lib) enabled;
in {
  # Git aliases (cross-shell)
  home.shellAliases = {
    g     = "git";
    ga    = "git add";
    gaa   = "git add ./";
    gc    = "git commit";
    gca   = "git commit --amend --no-edit";
    gcm   = "git commit --message";
    gp    = "git push";
    gpf   = "git push --force-with-lease";
    gpl   = "git pull";
    gplr  = "git pull --rebase";
    gpls  = "git pull --recurse-submodules";
    gst   = "git stash";
    gstp  = "git stash pop";
    gs    = "git switch";
    gsc   = "git switch -c";
    gco   = "git checkout";
    grb   = "git rebase";
    grbi  = "git rebase --interactive";
    gd    = "git diff";
    gds   = "git diff --staged";
    gsh   = "git show --ext-diff";
    gl    = "git log";
    glo   = "git log --oneline --graph";
    glp   = "git log --patch --ext-diff";
    gstat = "git status";

    # Jujutsu
    jl  = "jj log";
    jd  = "jj diff";
    jn  = "jj new";
    js  = "jj status";
    jds = "jj describe";

    # Tools
    lg = "lazygit";
  };

  programs.git = enabled {
    settings = {
      user.name  = "Constantin Luckenbach";
      user.email = "cluckenbach@protonmail.com";

      init.defaultBranch   = "main";
      push.autoSetupRemote = true;
      pull.rebase          = true;
      rebase.autoStash     = true;
      rebase.autoSquash    = true;
      rerere.enabled       = true;
    };
  };

  programs.difftastic = enabled {
    git.enable = true;
    options.background = "dark";
  };

  programs.jujutsu = enabled {
    settings = {
      user = {
        name  = "Constantin Luckenbach";
        email = "cluckenbach@protonmail.com";
      };
      ui = {
        editor         = "nvim";
        diff-formatter = [ "difft" "--color=always" "$left" "$right" ];
        diff-editor    = ":builtin";
      };
      signing = {
        behavior = "own";
        backend  = "gpg";
      };
    };
  };
}
