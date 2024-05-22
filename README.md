| **Distro**    | [**NixOS**](https://nixos.org/)                                                                |
|:--------------|:-----------------------------------------------------------------------------------------------|
| WM/Compositor | [Qtile](https://github.com/qtile/qtile)                                                        |
| Terminal      | [Kitty](https://github.com/kovidgoyal/kitty)                                                   |
| Shell         | [Zsh](https://www.zsh.org/) + [Starship](https://github.com/starship/starship)                 |
| Text Editors  | [VSCode](https://github.com/microsoft/vscode)                                                  |
| Menu          | [Rofi](https://github.com/lbonn/rofi)                                                          |

## Install
```bash
sudo mv /etc/nixos /etc/nixos.bak # backup og config
sudo nixos-rebuild switch --flake github:kcoopermiller/dotfiles#nixos # deploy flake.nix in current directory
```
