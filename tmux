set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*256col*:Tc"

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'dracula/tmux'

set -g @dracula-plugins "cpu-usage ram-usage"

run '~/.tmux/plugins/tpm/tpm'
