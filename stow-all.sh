for i in $(ls -d */ | sed 's/.$//'); do stow -t $HOME "$i"; done;
