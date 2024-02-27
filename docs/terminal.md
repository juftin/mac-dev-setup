# Terminal Configuration

## Terminal Setup

### Xcode

Install [Xcode] using the built-in `Terminal` app

```shell
xcode-select --install
```

### Homebrew

Install [Homebrew] using the built-in `Terminal` app

[Homebrew] calls itself "The missing package manager for macOS" and is an essential tool for
any developer.

Installation

-   Before you can run [Homebrew] you need to have the Command Line Tools for [Xcode](#xcode)
    installed.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

![homebrew.png](_static/homebrew.png)

### iTerm2

Install [iTerm2]

[iTerm2] is an open source replacement for Apple's Terminal. It's highly customizable and comes
with a lot of useful features.

```shell
brew install --cask iterm2
```

![iterm2.png](_static/iterm2.png)

## Terminal Customization

### Hotkey Shortcut

Create a custom hot-key to launch [iTerm2] from
anywhere: (`^` + `⌥` + `⌘` + `i`)

-   `iTerm2 Preferences` -> `Keys` -> `Hotkey` -> `Create dedicated hotkey window`
-   Set iTerm2 to open (hidden) at login: `System Preferences` -> `Users & Groups`
    -> `Login Items`
-   If not already, set all profiles to use the `MesloLGS NF` font
    in `iTerm2 Preferences` -> `Profile` -> `Text` -> `Font`

![iterm_hotkey.png](_static/iterm_hotkey.png)

### ZSH Plugins

![_static/powerlevel10k.png](_static/powerlevel10k.png)

#### zinit

This guide uses a plugin manager for [zsh] called [zinit]. It is a small set of functions that help
you easily manage your shell (zsh) plugins.

With the following snippet on your `~/.zshrc`, `zinit` will automatically bootstrap
itself with the following plugins (see the [References](references.md) page for
the full files):

-   [OhMyZsh] - The framework for managing your zsh shell
-   [romkatv/powerlevel10k] - A powerful OhMyZSH theme and prompt

-   [git] - Git aliases and functions
-   [dotenv] - Loads environment variables from `.env` for the current directory
-   [macos] - macOS-specific configuration for zsh
-   [autojump] - A cd command that learns
-   [web-search] - Search the web from the terminal
-   [nvm] -nvm (the Node Version Manager) plugin
-   [asdf] - asdf (the extendable version manager) plugin

-   [zsh-users/zsh-syntax-highlighting] - Fish shell-like syntax highlighting for zsh
-   [zsh-users/zsh-autosuggestions] - Fish-like autosuggestions for zsh
-   [zsh-users/zsh-completions] - Additional completion definitions for zsh

```shell
##########################################################
####################### zinit init #######################
##########################################################

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node
### End of Zinit's installer chunk

##########################################################
################### zinit - plugins ######################
##########################################################

setopt promptsubst  # Enable prompt substitution

# oh-my-zsh plugins
zinit wait lucid for \
    OMZP::git \
    OMZP::dotenv \
    OMZP::asdf \
    OMZP::web-search \
    OMZP::nvm

# powerlevel10k - zsh prompt
zinit ice depth"1"  # git clone depth
zinit light romkatv/powerlevel10k
[[ ! -f ${HOME}/.p10k.zsh ]] || source ${HOME}/.p10k.zsh

# third party plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

##########################################################
##########################################################

# Shell - Settings
export EDITOR="nano"
unsetopt autocd  # disable autocd

# Shell - History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt append_history			# Dont overwrite history
setopt extended_history			# Also record time and duration of commands.
setopt share_history			# Share history between multiple shells
setopt hist_expire_dups_first	# Clear duplicates when trimming internal hist.
setopt hist_find_no_dups		# Dont display duplicates during searches.
setopt hist_ignore_dups			# Ignore consecutive duplicates.
setopt hist_ignore_all_dups		# Remember only one unique copy of the command.
setopt hist_reduce_blanks		# Remove superfluous blanks.
setopt hist_save_no_dups		# Omit older commands in favor of newer ones.
setopt hist_expire_dups_first   # Expire duplicates first when trimming history.
setopt hist_verify				# Don't execute expanded history commands.
setopt inc_append_history		# Add commands to the history file immediately.

# Shell - Search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# Shell - Autocomplete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

# Shell - Aliases
alias c="clear"
alias ls="ls -G -a -F"
```

> NOTE: **autojump**
>
> The `autojump` plugin requires the `autojump` package to be installed via [Homebrew].
> It's been omitted from this snippet but included on the final `~/.zshrc` file in the
> [References](references.md) page.
>
> ```shell
> brew install autojump
> ```

Upon opening a new terminal window, you should see the [OhMyZsh] prompt with the
[romkatv/powerlevel10k] theme. It will guide you through the setup process.

[Xcode]: https://developer.apple.com/xcode/
[Homebrew]: https://brew.sh/
[iTerm2]: https://www.iterm2.com/
[OhMyZsh]: https://github.com/robbyrussell/oh-my-zsh
[zsh-users/zsh-syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting
[zsh-users/zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions
[romkatv/powerlevel10k]: https://github.com/romkatv/powerlevel10k
[git]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
[dotenv]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dotenv
[macos]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
[autojump]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autojump
[web-search]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
[nvm]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm
[asdf]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf
[zinit]: https://github.com/zdharma-continuum/zinit
[zsh-users/zsh-completions]: https://github.com/zsh-users/zsh-completions
[zsh-users/zsh-history-substring-search]: https://github.com/zsh-users/zsh-history-substring-search
