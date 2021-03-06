# Lights control
# (todo) https://wiki.archlinux.org/index.php/Mac#Light_sensor 

# Brightness for Screen and Keyboard via dbus
gbrightness() {
    gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.freedesktop.DBus.Properties.Set org.gnome.SettingsDaemon.Power.$1 Brightness "<int32 $2>" > /dev/null
}

# Brightness for external monitor via i2c
ddcbrightness () {
    nohup sh -c \
        "ddcutil setvcp -d 1 10 $1 && ddcutil setvcp -d 2 10 $1" \
        > /dev/null 2>&1 &!
}

# Philips Hue scene switcher
huescene() {
    # Default Group ID: 1 (living room)
    : "${2:=1}"
    id=$(hueadm scenes -o id,name -H | grep -m 1 $1 | awk '{split($0,a," "); print a[1]}')
    hueadm recall-scene $id $2 > /dev/null
}

desklamp() {
    : "${1:=on}"
    # Default Lamp ID: 3 (desk lamp)
    hueadm light 3 $1 
}

nightlight() {
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
    gbrightness Keyboard 50
    gbrightness Screen 10
    ddcbrightness 0
    huescene nightmood
}

daylight() {
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
    gbrightness Keyboard 100    
    gbrightness Screen 20
    ddcbrightness 5
    huescene daymood
}