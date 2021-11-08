https://michaelabrahamsen.com/posts/using-brave-browser-flags-in-linux/

Update: it works now also with AUR brave-bin
it adds flags in `.config/brave-flags.conf` in addition to the default flags like
e.g.
/usr/lib/brave-bin/brave --enable-crashpad --disable-client-side-phishing-detection --disable-domain-reliability --enable-dom-distiller --no-pings 
--enable-features=AutoupgradeMixedContent,SafetyTip,LegacyTLSEnforced,DnsOverHttps,WebUIDarkMode,PrefetchPrivacyChanges,PasswordImport,ReducedReferrerGranularity 

