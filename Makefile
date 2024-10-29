.PHONY: update
update:
	home-manager switch --flake .#theunconcernedape

.PHONY: clean
clean:
	nix-collect-garbage -d
