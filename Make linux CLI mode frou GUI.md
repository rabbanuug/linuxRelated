### Switching to Command-Line Mode

If you no longer need the GUI and prefer to operate solely from the command line, you can switch to a virtual console or configure the system to boot into text mode by default.

a. Temporarily Switch to a Virtual Console:

    Use Keyboard Shortcuts:
        Press Ctrl + Alt + F1 to Ctrl + Alt + F6 to switch to different virtual consoles.
        To return to the GUI, press Ctrl + Alt + F7 or Ctrl + Alt + F8 (depending on your system).

b. Boot into Command-Line Mode by Default:

    Modify the Default Systemd Target: Kali Linux uses systemd for managing system services. To set the system to boot into multi-user (command-line) mode instead of the graphical target, execute the following commands:

```bash
sudo systemctl set-default multi-user.target
```


Reboot the System:

```bash
sudo reboot
```

After rebooting, the system will start in command-line mode. If you ever need to return to the GUI, you can switch the default target back:

    sudo systemctl set-default graphical.target
    sudo reboot

c. Disable the GUI Service (Optional):

If you want to prevent the GUI from starting entirely, you can disable the display manager service.

    Identify the Display Manager: Kali typically uses lightdm. Verify by checking the status:

```bash
systemctl status lightdm
```

Disable LightDM:

```bash
sudo systemctl disable lightdm
```

Stop LightDM Immediately (Optional):

`sudo systemctl stop lightdm`

Now, the GUI will not start on boot. To re-enable it, use:
```bash
sudo systemctl enable lightdm
sudo systemctl start lightdm
```

3. Additional Tips

    Locking the Terminal: If you’re operating in command-line mode and want to secure your session, consider using tools like vlock:

sudo apt update
sudo apt install vlock
vlock

Preventing Screen Blanking in TTYs: To prevent the console from blanking (i.e., turning off the display after inactivity), you can disable the blank setting:

sudo setterm -blank 0 -powerdown 0

To make this persistent across reboots, add the command to /etc/rc.local before the exit 0 line:

sudo nano /etc/rc.local

Add:

setterm -blank 0 -powerdown 0

Save and exit.
