
xrdb ~/.Xresources
source ~/Pictures/wallpaper.sh &
conky &
#xcompmgr -cfF -D1 &
rofi -i3 -key-window mod4+g -key-run mod4+shift+d -key-ssh mod4+shift+s -switchers "run,window,ssh" &
exec dbus-launch /usr/bin/i3 -V -d all
