# Fedora-Minimal-Desktop : Tested in (Fedora-36)
A script that automatically install a basic gnome and kde desktop with only necessary things

# What's in ?
## GNOME
Fedora base, Gnome-Shell, GDM, Firefox, Nautilus, Gnome-Console, Gnome-Text-Editor, Gnome-Software(Optional), some base font



![Gnome 42 Fedora 36](https://raw.githubusercontent.com/Dansito/Fedora-Minimal-Desktop/Fedora-36/assets/gnome42.png)


## KDE
Fedora base, plasma-nm, sddm, firefox, dolphin, konsole, kate, ark, spectacle, discover(optional), some base font


![Kde 5.24 Fedora 36](https://raw.githubusercontent.com/Dansito/Fedora-Minimal-Desktop/Fedora-36/assets/kde524.png)

# How to use ?
Download fedora server netinstall iso : https://getfedora.org/server/download/
boot and do all your partitions language and so...
Install these packages : 
![Capture d’écran du 2021-11-27 17-02-57](https://user-images.githubusercontent.com/52078885/143689539-ed02c38c-9532-4995-b228-ed0c787bf4b5.png)
![Capture d’écran du 2021-11-27 17-03-18](https://user-images.githubusercontent.com/52078885/143689540-50cff02c-a663-4754-9645-683f977a0526.png)

Download the script on your machine : curl -L https://bit.ly/3r4SE1M -o fedora-minimal-install.sh



# Execute
```
sudo chmod 777 fedora-minimal-install.sh

sudo ./fedora-minimal-install.sh or with root account

```

# Note
If you have problems regarding proprietary drivers run this command

```
sudo dnf install @hardware-support

```
