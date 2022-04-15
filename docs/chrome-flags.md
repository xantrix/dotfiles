# Arch docs 
https://wiki.archlinux.org/title/chromium

google-chrome AUR — stable release; chrome-flags.conf
google-chrome-beta AUR — beta release;
google-chrome-dev AUR — development release. chrome-dev-flags.conf

# User Data Directory
https://chromium.googlesource.com/chromium/src/+/HEAD/docs/user_data_dir.md#Linux

# To determine the user data directory for a running Chrome instance:
Navigate to chrome://version
Look for the `Profile Path` field. This gives the path to the profile directory.
The user data directory is the parent of the profile directory.

# To determine the Profiles directory
chrome://local-state/
Search "profile" key

The default location is in ~/.config:

[Chrome Stable] ~/.config/google-chrome
[Chrome Beta] ~/.config/google-chrome-beta
[Chrome Dev] ~/.config/google-chrome-unstable
[Chromium] ~/.config/chromium

# Cache
[user data dir] ~/.config/google-chrome
[profile dir] ~/.config/google-chrome/Default
[user cache dir] ~/.cache/google-chrome/Default

# chrome flags
chrome://flags/
do not use comments in chrome-flags.conf: it prevents to pass the flags correctly
make sure to have all flags set in running chrome (use ps or htop)
e.g. /opt/google/chrome/chrome --disable-gpu-driver-bug-workarounds --ignore-gpu-blacklist --enable-gpu-rasterization --enable-zero-copy --password-store=gnome
or use chrome://version//flags 
also check in 
chrome://local-state/
if the flag is enabled in
   "browser": {
      "enabled_labs_experiments": [ "enable-webrtc-pipewire-capturer@1" ],

# Force GPU acceleration
https://wiki.archlinux.org/title/chromium#Force_GPU_acceleration
--ignore-gpu-blocklist
--enable-gpu-rasterization
--enable-zero-copy

# set password store
best to explicitly pass the password store to use (--password-store=gnome). 
The default is to automatically detect based on the desktop environment

# Native Wayland support
https://chromium.googlesource.com/chromium/src/+/HEAD/docs/ozone_overview.md
Warning: Experimental Ozone feature is available in the official Chrome distributions since m87. It is not required to build Ozone for Linux anymore for the purpose of testing. It is enough to start Chrome with the following flags - ./chrome --enable-features=UseOzonePlatform --ozone-platform={x11/wayland}.

Chrome > 91
#use-ozone-platform
or
--enable-features=UseOzonePlatform 
--ozone-platform=wayland
or
--ozone-platform-hint=wayland

font size issue
https://blogs.igalia.com/adunaev/2020/11/13/hidpi-support-in-chromium-for-wayland/
--force-device-scale-factor

https://blogs.igalia.com/msisov/2020/11/20/chrome-chromium-on-wayland-the-waylandification-project/

Performance
https://www.youtube.com/watch?v=1XQMF0fTxsg&ab_channel=BlinkOn

# only in wayland
--enable-webrtc-pipewire-capturer 

https://www.chromium.org/developers/design-documents/chromium-graphics/how-to-get-gpu-rasterization
--force-gpu-rasterization

# Video Decode: Hardware accelerated
https://www.linuxuprising.com/2021/01/how-to-enable-hardware-accelerated.html
--enable-accelerated-video-decode

# Vulkan
https://linuxreviews.org/Chromium_79_Has_Experimental_Vulkan_Support_And_You_Should_NOT_Enable_It