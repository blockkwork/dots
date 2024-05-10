pgrep -x sxhkd >/dev/null || sxhkd &
nvidia-settings --load-config-only
picom &
bash ~/.config/polybar/launch.sh
xsetroot -cursor_name left_ptr
xrdb merge ~/.Xresources
dunst &
nitrogen --set-scaled Pictures/wallpapers/wallpaper.jpg &
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle" &
imwheel &
