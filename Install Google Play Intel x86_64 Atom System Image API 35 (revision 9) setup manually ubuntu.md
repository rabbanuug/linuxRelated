There have 2 way to setup "Install Google Play Intel x86_64 Atom System Image API 35 (revision 9)" in ubuntu
1. By downloading the zip folder from the link
2. From terminal directly

1. downloading zip file
you'll get it from the android studio when try installing that.
then extract all file of 'x86_64-35_r09.zip' in this location '~/Android/Sdk/system-images/android-35/google_apis_playstore/x86_64/'

2. Using terminal | before executing the command, ensure the name sdk or Sdk. If Sdk then rename all the sdk to Sdk. Also install commandline tools from here https://developer.android.com/studio
```bash
sudo apt-get update
sudo apt-get install openjdk-11-jdk
mkdir -p ~/Android/sdk # check here
unzip ~/Downloads/commandlinetools-linux-*.zip -d ~/Android/sdk/cmdline-tools
mv ~/Android/sdk/cmdline-tools/cmdline-tools ~/Android/sdk/cmdline-tools/tools
export ANDROID_SDK_ROOT=~/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator
source ~/.bashrc
sdkmanager --list  # Just to ensure sdkmanager is working
sdkmanager --licenses

# Accept all licenses by typing y when promt

sdkmanager --install "system-images;android-35;google_apis_playstore;x86_64"
sdkmanager --list | grep android-35
```
