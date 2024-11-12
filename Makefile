.PHONY: desktop
desktop:
	home-manager switch --flake .#desktop

.PHONY: server
server:
	home-manager switch --flake .#server

.PHONY: update
update:
	nix flake update

.PHONY: clean
clean:
	nix-collect-garbage -d
