# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
    OMZP::autojump \
    OMZP::web-search \
    OMZP::nvm

# oh-my-zsh theme
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

# history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Shell - Aliases
alias c="clear"
alias ls="ls -G -a -F"

[[ ! -f ${HOME}/.zsh_aliases ]] || source ${HOME}/.zsh_aliases

# Environment Variables
[[ ! -f ${HOME}/.zshenv ]] || source ${HOME}/.zshenv

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## pipx
export PATH="$PATH:${HOME}/.local/bin"  # pipx
export PIPX_DEFAULT_PYTHON=$(pyenv which python)  # pipx

## thefuck
eval "$(thefuck --alias)"
eval "$(thefuck --alias dang)"

# awsume
alias awsume="source \$(pyenv which awsume)"

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
