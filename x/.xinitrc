
xrdb ~/.Xresources
xbindkeys
source ~/Pictures/wallpaper.sh &
conky &
#xcompmgr -cfF -D1 &
exec dbus-launch /usr/bin/i3 -V -d all >> ~/.i3/logfile
