# Command history options
HISTFILE=~/.zshhistfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# As tempting as vim-like keybindings (use -v below) are, I am
# already trained for cntrl-r backsearch and don't want to futz too much
# So will stick with emacs bindings
bindkey -e

# Command completion
autoload -Uz compinit
compinit
# Makes a completion menu appear
zstyle ':completion:*' menu select

# Autocorrect
setopt CORRECT

# Sets prompt to username:working_dir:PROMPT_CHARACTER
PROMPT="%n:%~%# "

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Colors
# Try GPT suggested colors
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.gz=01;31:*.bz2=01;31:*.xz=01;31:*.zip=01;31:*.7z=01;31:*.jpg=01;35:*.gif=01;35:*.png=01;35:*.avi=01;35:*.mpg=01;35:*.mp3=00;36:*.ogg=00;36:*.flac=00;36:*.wav=00;36:';
export LS_COLORS

# Colorized prompt
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# Version control information (git)
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
PS1="\$vcs_info_msg_0_$PS1"

# Aliases
alias octave='octave --no-gui'
alias ls='ls --color=auto'

# Automatically start tmux if not already in a tmux session
if command -v tmux &> /dev/null; then
    [ -z "$TMUX" ] && exec tmux
fi
