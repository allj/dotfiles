# ================================================================================
# INSTANT PROMPT
# ================================================================================

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ================================================================================
# EXPORTS
# ================================================================================

export FZF_DEFAULT_COMMAND='fd --type file --hidden'
export BAT_THEME="gruvbox-dark"

# ================================================================================
# ALIASES
# ================================================================================

alias ls='ls -G'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -R'
alias v='f -e nvim'
alias c='f -e code'
alias m='f -e mpv'
alias xxd='xxd -g 1'
alias man=batman
alias rgi='rg -i'
alias rgv='rg -v'
alias rgb=batgrep
alias brew_x86_64='arch -x86_64 /usr/local/bin/brew'
alias brew_m1='arch -arm64e /opt/homebrew/bin/brew'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ================================================================================
# OPTIONS
# ================================================================================

unsetopt BEEP
setopt HIST_IGNORE_SPACE

# ================================================================================
# KEY BINDINGS
# ================================================================================

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ================================================================================
# ZSTYLE
# ================================================================================

# Wait this many seconds for typing to stop, before showing completions.
# -1: Don't autocomplete
zstyle ':autocomplete:*' min-delay -1  # float

# Wait until this many characters have been typed, before showing completions.
zstyle ':autocomplete:*' min-input 3  # int

# NOTE: This setting can NOT be changed at runtime and requires that you
# have installed Fzf's shell extensions.
# no:  Tab uses Zsh's completion system only.
# yes: Tab first tries Fzf's completion, then falls back to Zsh's.
zstyle ':autocomplete:*' fzf-completion yes

# no:  Tab inserts the top completion.
# yes: Tab first inserts a substring common to all listed completions, if any.
zstyle ':autocomplete:tab:*' insert-unambiguous yes

# If there are fewer than this many lines below the prompt, move the prompt up
# to make room for showing this many lines of completions (approximately).
zstyle ':autocomplete:*' list-lines 16  # int

# NOTE: This setting can NOT be changed at runtime.
# complete-word: (Shift-)Tab inserts the top (bottom) completion.
# menu-complete: Press again to cycle to next (previous) completion.
# menu-select:   Same as `menu-complete`, but updates selection in menu.
zstyle ':autocomplete:*' widget-style menu-select

# ================================================================================
# ZSH LINE EDITOR
# ================================================================================

autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

# ================================================================================
# FUNCTIONS
# ================================================================================

vimz() {
    fd "$@" | fzf --prompt "vim " -1 -0 -m --bind ctrl-a:toggle-all | xargs nvim -p
}

codz() {
    fd "$@" | fzf --prompt "vscode " -1 -0 -m --bind ctrl-a:toggle-all | xargs code
}

# ================================================================================
# INIT
# ================================================================================

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_COMPLETION_TRIGGER='**'
export FZF_COMPLETION_OPTS='--info=inline'

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    *)            fzf "$@" ;;
  esac
}

# fasd
eval "$(fasd --init auto)"
unalias sd

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# asdf
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# Sheldon
eval "$(sheldon source)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
