# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

# P10K - Keep Near Top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH Home + Settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"

# ZSH Plugins
plugins=(
	git
	colored-man-pages
	colorize
	pip
	python
	brew
	macos
	zsh-syntax-highlighting
	zsh-autosuggestions
	web-search
	docker
	docker-compose
	aws
)

source $ZSH/oh-my-zsh.sh

# Default Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Sourced Files
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.zsh_aliases ]] || source ~/.zsh_aliases
[[ ! -f ~/.zshenv ]] || source ~/.zshenv

export PATH="$PATH:/Users/juftin/.local/bin" # pipx

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias dang)

# Disable AUTO_CD option (changing dir without cd)
unsetopt AUTO_CD

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
