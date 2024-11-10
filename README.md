# NixOS Configuration

This repository contains my NixOS configuration files, designed to manage both system-level and user-level configurations efficiently using Nix and Home Manager.

## Features
- **System Configuration**: Includes the `configuration.nix` for NixOS 24.05.
- **User Configuration**: Managed via Home Manager, with custom Zsh settings.
- Easy setup and maintainability with clear instructions for replication.

## Getting Started

### Prerequisites
1. Fresh installation of **NixOS 24.05**.
2. Ensure you have `make` installed for building user configurations.
3. Basic familiarity with NixOS and Home Manager setup.

### Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/nixos-config.git
   cd nixos-config
   ```

2. **Set the system configuration**:
   - Backup the existing configuration:
     ```bash
     sudo mv /etc/nixos/configuration.nix{,.BKP} -v
     ```
   - Symlink the repository's `configuration.nix`:
     ```bash
     sudo ln -sv $(pwd)/configuration.nix /etc/nixos/configuration.nix
     ```

3. **Rebuild the system**:
   ```bash
   sudo nixos-rebuild switch
   ```

4. **Build user-specific files**:
   - Update `username.nix` to reflect your username.
   - Modify `home.nix` to customize the package list and settings.
   - Build the user configuration:
     ```bash
     make
     ```

## Directory Structure
- `flake.nix`: Defines the Nix flake configuration for the repository.
- `flake.lock`: Records the exact dependencies used by the flake for reproducibility.
- `configuration.nix`: Contains system-wide NixOS configuration and serves as the target for the symlink in `/etc/nixos/configuration.nix`.
- `home.nix`: User-level configuration managed by Home Manager.
- `username.nix`: Stores the username as a single string for user-specific configurations.
- `Makefile`: Simplifies building and applying user configurations.

## Customization
Feel free to edit the configurations to suit your needs. Refer to the [NixOS](https://nixos.org/) and [Home Manager](https://nix-community.github.io/home-manager/) documentation for further guidance.

## License

[GNU General Public License v2.0](https://choosealicense.com/licenses/gpl-2.0/)

---

Happy Nix-ing! 🎉
