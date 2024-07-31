# TMUX

## Sessions:

| Command | Description |
| --- | --- |
| tmux new -s <session_name> | Create New Session |
| tmux new -s <session_name> -d | Create New Session and don´t attach to it |
| tmux a -t <session_name> | Attach to a Session |
| tmux ls | List Sessions |
| prefix + d | detach from current Sessions |

## Windows:

| Command | Description |
| --- | --- |
| prefix + c | Create Window |
| prefix + n | Move to next Window |
| prefix + p | Move to previous Window |
| prefix + , | Rename Window |
| prefix + & | Kill Window |

## Panes:

| Command | Description |
| --- | --- |
| prefix + v | Split Vertically (tmux.conf modified) |
| prefix + h | Split horizontally  (tmux.conf modified) |
| prefix + z | maximize/minize pane |
| prefix + x | Kill pane |
| prefix + { | swap current pane with the previous pane |


## TPM (Plugin manager):
| Command | Description |
| --- | --- |
| prefix + I (capital) | Installs new plugins from GitHub or any other git repository |
| prefix + U | updates plugins |
| prefix + alt + u | remove plugins not onthe plugin list |
