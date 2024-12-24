# Introduction

My personal zsh themes.

## Usage

### NixOS (requires oh-my-zsh)

1. Download the repo and copy all of the themes into the oh-my-zsh custom themes directory

```nix
  ikostov-zsh-themes = pkgs.fetchFromGitHub {
    owner = "IliyanKostov9";
    repo = "zsh-themes";
    rev = "master";
    hash = "sha256-lyo8nRXjOoAJRDUNsF8+IHRZSrsGBuLMcrYBTAGP4iA=";
  };

  zsh-themes = pkgs.stdenv.mkDerivation {
    name = "oh-my-custom-zsh-theme";
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/themes
      cp ${ikostov-zsh-themes}/themes/*.zsh-theme  $out/themes/
    '';
  };
```

2. Reference your favorite theme in the oh-my-zsh derivation

```nix

oh-my-zsh = {
  enable = true;
  theme = "af-purple-magic";
  custom = "${zsh-themes}";
};
```
