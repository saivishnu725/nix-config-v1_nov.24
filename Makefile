.PHONY: update
update:
	home-manager switch --flake .#currentuser

.PHONY: clean
clean:
	nix-collect-garbage -d
