for i in $(ls -d */ | sed 's/.$//'); do stow -D "$i"; done;
