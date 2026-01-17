_: self: _: let
  inherit (self) mkMerge;
in {
  merge = mkMerge [] // {
    __functor = self: next: self // {
      contents = self.contents ++ [ next ];
    };
  };

  enabled  = self.merge { enable = true; };
  disabled = self.merge { enable = false; };
}
