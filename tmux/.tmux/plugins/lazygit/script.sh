tmux_session_name=$(tmux display-message -p -F "#{session_name}");
tmux_session_path=$(tmux display-message -p -F "#{session_path}");
[ "$tmux_session_name" = "popup_lazygit" ] && tmux detach-client && exit 0;
tmux has -t popup_lazygit && [ "$tmux_session_path" != "$(tmux display-message -p -t popup_lazygit -F "#{session_path}")" ] && tmux kill-session -t popup_lazygit;
tmux a -t popup_lazygit || tmux new -c "$(pwd)" -s popup_lazygit "bash -c \"tmux set status off && lazygit\"";
