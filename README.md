# Benedikt's dotfiles

This repository includes most of my personal dotfiles (configuration and ricing)
for the applications listed below. Enjoy!

![Image of an example setup](preview.png "An example setup")
*Wallpaper by Masashi Wakui*


## Installation

1.  **Symlink the dotfiles**  
    Clone the repository and run the `./install` script to automatically
    symlink all dotfiles to your ~/.config directory.

2.  **Run the setup tasks**  
    After symlinking, the installer will ask whether to run the included
    setup tasks, which can set up some dependencies automatically.

    *   **Task 1:** [Install Python dependencies for scripts](/setup-tasks/install-pip)  
        Installs any Python packages required by the included
        [desktop scripts](https://gitlab.com/BVollmerhaus/scripts).
        Note that it doesn't install system packages, see step 3.
        > Alternatively, run `pip -r requirements.txt` in the scripts/ directory.

    *   **Task 2:** [Download patched M+ font from Nerd Fonts](/setup-tasks/install-fonts)  
        Downloads the M+ font from the Nerd Fonts repo to your local font
        directory (~/.local/share/fonts) and updates the font cache.
        > Alternatively, install [the font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/MPlus)
        or a complete [Nerd Fonts package](https://aur.archlinux.org/packages/nerd-fonts-complete/) yourself.

3.  **Install script dependencies**  
    The included scripts require system packages that can't be installed
    by the setup tasks due to the wide variety of package managers.
    Common distributions will most likely bundle them but for everything
    else you'll have to install them by hand. For example on Arch:
    ```shell
    pacman -S wmctrl libnotify
    ```


## Applications

### User Interface / DE
| Name | Repository | Package(s) | Description |
| ---- | ---------- | ---------- | ----------- |
| i3-gaps | [GitHub](https://github.com/Airblader/i3) | i3-gaps ([Arch](https://www.archlinux.org/packages/community/x86_64/i3-gaps/)) | The well-known i3 tiling window manager, enhanced with support for gaps.
| Polybar | [GitHub](https://github.com/jaagr/polybar) | polybar ([AUR](https://aur.archlinux.org/packages/polybar/)) | A nicer looking and more customizable alternative to i3bar, great for ricing.
| Dunst | [GitHub](https://github.com/dunst-project/dunst) | dunst ([Arch](https://www.archlinux.org/packages/community/x86_64/dunst/)) | Lightweight and customizable notification daemon with keyboard shortcuts.

### Terminals
| Name | Repository | Package(s) | Description |
| ---- | ---------- | ---------- | ----------- |
| URxvt | [CVS](http://cvs.schmorp.de/rxvt-unicode/) | rxvt-unicode ([Arch](https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/)) | An [rxvt](http://rxvt.sourceforge.net/) fork with Unicode support, window transparency and plugins.
| Alacritty | [GitHub](https://github.com/jwilm/alacritty) | alacritty ([Arch](https://www.archlinux.org/packages/community/x86_64/alacritty/)) | A GPU-accelerated terminal for when URxvt is too slow for something.

### Productivity
| Name | Repository | Package(s) | Description |
| ---- | ---------- | ---------- | ----------- |
| ranger | [GitHub](https://github.com/ranger/ranger) | ranger ([Arch](https://www.archlinux.org/packages/community/any/ranger/)) | An easily extendable file manager for the terminal with Vim-style key bindings.
| Rofi | [GitHub](https://github.com/DaveDavenport/rofi) | rofi ([Arch](https://www.archlinux.org/packages/community/x86_64/rofi/)) | Window switcher, application launcher and dmenu replacement, all in one tool.
| fzf | [GitHub](https://github.com/junegunn/fzf) | fzf ([Arch](https://www.archlinux.org/packages/community/x86_64/fzf/)) | A fuzzy finder for the terminal; very useful for accessing the command history.

### Ricing (Theming)
| Name | Repository | Package(s) | Description |
| ---- | ---------- | ---------- | ----------- |
| Pywal | [GitHub](https://github.com/dylanaraps/pywal) | python-pywal ([Arch](https://www.archlinux.org/packages/community/any/python-pywal/)), [PyPI](https://pypi.org/project/pywal/) | Generates color schemes for i3, the terminal, etc. from wallpapers.

### Editors
| Name | Repository | Package(s) | Description |
| ---- | ---------- | ---------- | ----------- |
| Vim | [GitHub](https://github.com/vim/vim) | vim ([Arch](https://www.archlinux.org/packages/extra/x86_64/vim/)) | One of the most widely known and fully-featured modal text editors.
| Kakoune | [GitHub](https://github.com/mawww/kakoune) | kakoune ([Arch](https://www.archlinux.org/packages/community/x86_64/)) | A Vim-replacement with a focus on [interactivity](http://kakoune.org/why-kakoune/why-kakoune.html) and visual feedback.


## Install-it-all (Arch and derivatives)

You may use the following to install all of the above (non-AUR) packages:
```shell
pacman -S i3-gaps dunst rxvt-unicode alacritty ranger rofi fzf python-pywal vim kakoune
```

And to install the AUR packages with your tool of choice
([yay](https://aur.archlinux.org/packages/yay/) in this case):
```shell
yay -S polybar
```


## Common Issues

*   **Graphical glitches when using Compton ("frozen Windows effect")**  
Compton *requires* a wallpaper or background color to be set, either manually
using feh/xsetroot or via Pywal (which in turn uses feh). Presumably this is
due to Compton not deliberately clearing the back buffer and thus old display
content is still shown if nothing else occupies the same display space,
overwriting the previous content (as a wallpaper would).

*   **Display manager (e.g. SDDM) "freezes" upon login**  
This could be the same issue as before and i3 may have actually started
correctly. Try to run a terminal using <kbd>Mod</kbd> <kbd>↵</kbd> – if it
opens as expected, you can be fairly sure that no background got set, possibly
because Pywal's cache path got deleted; just run it again with a wallpaper of
choice. However, if no terminal opens, you either don't have the default one
installed or i3 really failed to start.
