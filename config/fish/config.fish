# Author: Benedikt Vollmerhaus
# License: MIT

# Add local pip package directory to path
set -gx PATH ~/.local/bin $PATH
# Add local Ruby gems directory to path
set -gx PATH ~/.gem/ruby/2.6.0/bin $PATH

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
