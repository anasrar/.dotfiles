for i in $(ls -d */ | sed 's/.$//'); do stow -D -t $HOME "$i"; done;
