for i in $(ls -d */ | sed 's/.$//'); do stow "$i"; done;
