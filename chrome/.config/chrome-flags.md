# chrome flags
do not use comments in chrome-flags.conf: it prevents to pass the flags correctly
make sure to have all flags set in running chrome (use ps or htop)
e.g. /opt/google/chrome/chrome --disable-gpu-driver-bug-workarounds --ignore-gpu-blacklist --enable-gpu-rasterization --enable-zero-copy --password-store=gnome 
best to explicitly pass the password store to use (--password-store=gnome). 
The default is to automatically detect based on the desktop environment

# disbanded in last version
--enable-native-gpu-memory-buffers 
# only in wayland
--enable-webrtc-pipewire-capturer 

https://www.chromium.org/developers/design-documents/chromium-graphics/how-to-get-gpu-rasterization
--force-gpu-rasterization

# Video Decode: Hardware accelerated
--enable-accelerated-video-decode

# Vulkan
https://linuxreviews.org/Chromium_79_Has_Experimental_Vulkan_Support_And_You_Should_NOT_Enable_It