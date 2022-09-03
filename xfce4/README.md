# XFCE 4

<table>
  <tbody>
    <tr>
      <th align="center" width="70%">screenshot</th>
      <th align="center" width="30%">information</th>
    </tr>
    <tr>
      <td>
        <img alt="screenshot desktop" title="screenshot desktop" src="https://user-images.githubusercontent.com/38805204/188267258-aebb34a7-72ff-49b9-93a5-b8ea07fccc10.png" />
      </td>
      <td>
        <ul>
          <li><strong>theme</strong>: <a href="https://www.pling.com/p/1365372/">kripton</a></li>
          <li><strong>icon</strong>: <a href="https://www.pling.com/p/1586828">grade-icon-theme</a></li>
          <li><strong>fonts</strong>:
            <ul>
              <li><a href="https://github.com/rsms/inter">inter</a>, select variable version for crisp render</li>
              <li><a href="https://github.com/arrowtype/recursive">recursive mono</a> with nerd font patch</li>
            </ul>
          </li>
          <li><strong>terminal</strong>: <a href="https://github.com/alacritty/alacritty">alacritty</a> with color scheme <a href="https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_night.yml">tokyo night</a></li>
          <li><strong>terminal multiplexer</strong>: <a href="https://github.com/tmux/tmux">tmux</a></li>
          <li><strong>text editor</strong>: <a href="https://github.com/neovim/neovim">neovim</a></li>
          <li><strong>system monitor</strong>: <a href="https://github.com/xxxserxxx/gotop">gotop</a></li>
          <li><strong>music player</strong>: <a href="https://moc.daper.net">mocp</a></li>
          <li><strong>music visualizer</strong>: <a href="https://github.com/noriah/catnip">catnip</a></li>
          <li><strong>file manager</strong>: <a href="https://gitlab.xfce.org/xfce/thunar">thunar</a></li>
          <li><strong>image viewer</strong>: <a href="https://gitlab.xfce.org/apps/ristretto">ristretto</a></li>
          <li><strong>app finder</strong>: <a href="https://gitlab.xfce.org/xfce/xfce4-appfinder">xfce4-appfinder</a></li>
          <li><strong>panel/status bar</strong>: <a href="https://gitlab.xfce.org/xfce/xfce4-panel">xfce4-panel</a> with  <a href="https://gitlab.com/vala-panel-project/vala-panel-appmenu">vala-panel-appmenu</a></li>
          <li><strong>dock</strong>: <a href="https://github.com/ricotz/plank">plank</a></li>
          <li><strong>wallpaper</strong>: <a href="https://www.pixiv.net/en/artworks/75180363">pixiv: おかゆー</a></li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Config files

- xfce4-appfinder.xml
- xfce4-notifyd.xml
- xfce4-panel.xml
- xfwm4.xml
- xfsettings.xml

## GTK patch

```css
/* ~/.config/gtk-3.0/gtk.css */
/* Kripton Patch */

/* Xfce Panel */
.xfce4-panel.panel {
  border: 0;
  border-radius: 0;
}

/* Xfce Panel Workspace Button */
#pager-1 button {
  font-size: 0.8rem;
  color: rgba(255, 255, 255, 0.2);
  background: transparent;
}
#pager-1 button:checked,
#pager-1 button:active,
#pager-1 button:hover {
  color: rgba(255, 255, 255, 0.9);
  border: 0;
  box-shadow: none;
}

/* Button */
buttonbox.dialog-action-area.horizontal,
buttonbox.horizontal {
  padding: 0 6px 5px 6px;
}

/* Desktop Icon Label */
XfdesktopIconView.label {
  color: #f1f1f1;
  text-shadow: none;
}

/* Xfce Panel Power Manager Plugin */
#xfce4-power-manager-plugin {
  padding: 0 0.5rem;
}
#xfce4-power-manager-plugin label {
  padding: 0 0 0 0.5rem;
}
/* Xfce Panel Date */
#clock-button {
  padding: 0 0.5rem;
}

window.xfce4-panel widget > box > button > image {
  padding: 0.2em 0.16em;
  -gtk-icon-transform: scale(0.8);
}

window#whiskermenu-window treeview > * {
  padding: 0.2em 0.16em;
}
```
