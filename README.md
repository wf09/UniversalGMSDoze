# Universal GMS Doze
*Prevent unnecessary GMS wakelocks running in the background, optimized and adjusted with additional modified services*

## Installation Guides
- API 23 or later is supported.
- Avoid to use similar modules or tweaks at once.
- Either install from Magisk Manager or any custom recoveries.

## Troubleshooting
- Does not guarantee for any Google apps (GApps) package which contains modified XML by default or by the author(s).
- Need to wait 90 seconds or more to make sure the scripts executed well.
- Quick guide for how to fix delayed incoming messages issue, execute the scripts in terminal then reboot:
```
> su
> cd /data/data
> find . -type f -name '*gms*' -delete
```

## Development Supports
- **Donations:**
  - BCA (Indonesia) 1390195385
  - [PayPal](https://paypal.me/gloeyisk)
- **Mirror Links:**
  - [Telegram Channel](https://t.me/GLdppc)
  - [SourceForge](https://sourceforge.net/projects/gldpsf/files/magisk_modules/)
- **Source Code:**
  - [GitHub](https://github.com/gloeyisk/UniversalGMSDoze)
- **Support Thread:**
  - [XDA-Developers](https://forum.xda-developers.com/apps/magisk/module-universal-gms-doze-t3853710)

## Credits
- **@topjohnwu**; [Magisk](https://github.com/topjohnwu/Magisk)
- **@Zackptg5**; [MMT-Extended](https://github.com/Zackptg5/MMT-Extended)
- **Contributors and Donators**
