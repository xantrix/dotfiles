# Lights control
# (todo) https://wiki.archlinux.org/index.php/Mac#Light_sensor 

# Brightness for Screen and Keyboard via dbus
gbrightness() {
    gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.freedesktop.DBus.Properties.Set org.gnome.SettingsDaemon.Power.$1 Brightness "<int32 $2>" > /dev/null
}

# Brightness for external monitor via i2c
# get all features using ddcutil -d <monitor> getvcp KNOWN
# VCP code 0x10 (Brightness max 100
# VCP code 0x12 (Contrast max 100
# $1 monitor
ddcbrightness-get() {
    ddcutil -d $1 getvcp 10
}
ddccontrast-get() {
    ddcutil -d $1 getvcp 12
}
# $1 monitor, $2 value
ddcbrightness-set() {
    nohup sh -c \
        "ddcutil setvcp -d $1 10 $2" \
        > /dev/null 2>&1 &!
}
ddccontrast-set() {
    nohup sh -c \
        "ddcutil setvcp -d $1 12 $2" \
        > /dev/null 2>&1 &!
}

nightlight() {
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
}

daylight() {
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
}