# MIUI Gesture Fix with FNG Auto-Installer

This is a **Magisk module** that automatically:

- Installs [Fluid Navigation Gestures (FNG)](https://play.google.com/store/apps/details?id=com.fb.fluid)
- Grants Accessibility permission to FNG
- Hides the default navigation bar
- Runs these commands automatically on boot



## 🛠️ Installation

1. Flash via Magisk
2. Reboot
3. Done!



## Notes

- If you accidentally remove fng from recents you'll lose access to gestures. To prevent this follow the next point.
- After the first reboot, open and set up FNG. *Disable battery optimisation* for FNG. Then *lock it in recents*, swipe it away, and reboot again. This prevents FNG from appearing in recents while keeping it active in the background.
- Can be paired with Quickswitcher module to have immersive animations on 3rd party launchers.
- Module logs can be found at /data/local/tmp/



## Compatibility

- Devices: Redmi Note 8 Pro and similar MIUI-based devices
- MIUI Versions: Tested on 12.5.10 (India) and 12.5.5 (Indonesia)
- Android Versions: Likely works on Android 10+ (MIUI-based)



## 💬 Support

Feel free to open issues or pull requests if you want to help improve this project.



## ⚠️ Disclaimer

> This module ships with `fng.apk`, which is developed by [Francisco Barroso](https://play.google.com/store/apps/dev?id=5204239829224424241).  
> I am **not the creator** of FNG and do not claim ownership over it.  
> If you're the original developer and want it removed or linked externally, please contact me.



## 📖 License

This module's scripts are licensed under the [MIT License](LICENSE), excluding the FNG APK.  
Please ensure you comply with the licensing terms of third-party apps.
