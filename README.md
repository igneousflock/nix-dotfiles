# NixOS Configuration

This repo uses the [`den`](https://den.denful.dev/) framework to organize the configurations for a few of my computers running [NixOS](https://nixos.org/).

## Usage

NOTE: if `just` isn't present for some reason, replace its invocations below with `nix run nixpkgs#just --`.

```shell
just switch  # rebuild the config and switch to it
just check   # check the configuration via `nix flake check`
just flake   # write new `flake-file` dependencies
just update  # update flake dependencies
just vm      # run a VM emulating the `flock` host's configuration
```
