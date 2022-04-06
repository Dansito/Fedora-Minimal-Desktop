if [ $(whoami) = "root" ]
then
        echo "Welcome to fedora minimal desktop installer"
else
	echo "Please execute this script as root"
	echo "use : sudo fedora-minimal-install.sh"
	echo "or use your root account"
	exit 1
fi

echo "Would you like to optimize DNF with fastestmirror and max_parallel_download ?"
echo "(Downloading rpms will be faster)"
echo "1 = yes 0 = no"
opti=1
read opti

echo "Would you like to enable flathub repo?"
echo "(More apps are avalible on flathub)"
echo "1 = yes 0 = no"
flathub=1
read flathub

echo "Would you like to enable nvidia proprietary driver?"
echo "NVIDIA GPU ONLY GTX600+"
echo "1 = yes 0 = no"
nvidia=0
read nvidia

echo "Would you like to use XanMod Kernel ?"
echo "A custom kernel with F-Sync and other optimisations"
echo "1 = yes 0 = no"
xanmod=1
read xanmod


##Nvidia
if [ $nvidia = "1" ]
then
	dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
	dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
	sudo echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
	sudo dnf install xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs akmod-nvidia kmod-nvidia --allowerasing -y
	sudo dnf remove xorg-x11-drv-nouveau -y
else
	echo ""
fi


##Download optimisations
if [ $opti = "1" ]
then
	echo 'fastestmirror=1' >> /etc/dnf/dnf.conf
	echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf
else
	echo ""
fi


##Installing core apps
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

##DE Choice
echo "Which DE want to use?"
echo "1= GNOME 2= KDE"
dechoice=1
read dechoice

#GNOME
if [ $dechoice = "1" ]
then
	echo "Would you like to use Gnome-software?"
	echo "1= yes 0 = no"
	appstore=0
	read appstore
	if [ $appstore = "1" ]
	then
		dnf install gnome-shell gdm gnome-console firefox nautilus gnome-calculator gnome-system-monitor gnome-text-editor file-roller gnome-software gnome-tweaks chrome-gnome-shell @development-tools gdouros-symbola-fonts wget liberation-sans-fonts liberation-fonts liberation-serif-fonts liberation-narrow-fonts liberation-mono-fonts liberation-fonts-common google-noto-cjk-fonts google-noto-cjk-fonts-common google-noto-cjk-fonts-common -y
	else
		dnf install gnome-shell gdm gnome-console firefox nautilus gnome-calculator gnome-system-monitor gnome-text-editor file-roller gnome-tweaks chrome-gnome-shell @development-tools gdouros-symbola-fonts wget liberation-sans-fonts liberation-fonts liberation-serif-fonts liberation-narrow-fonts liberation-mono-fonts liberation-fonts-common google-noto-cjk-fonts google-noto-cjk-fonts-common google-noto-cjk-fonts-common -y
	fi
fi

#KDE
if [ $dechoice = "2" ]
then
	echo "Would you like to use Discover?"
	echo "1= yes 0 = no"
	appstore=0
	read appstore
	if [ $appstore = "1" ]
	then
		sudo dnf install NetworkManager-config-connectivity-fedora adwaita-gtk2-theme bluedevil breeze-icon-theme cagibi colord-kde cups-pk-helper dolphin firewall-config glibc-all-langpacks gnome-keyring-pam kcm_systemd kcolorchooser kde-gtk-config kde-partitionmanager kde-platform-plugin kde-print-manager kde-runtime kde-settings-pulseaudio kde-style-breeze kdegraphics-thumbnailers kdelibs kdeplasma-addons kdialog kdnssd kf5-akonadi-server kf5-akonadi-server-mysql kf5-baloo-file kf5-kipi-plugins kfind kgpg khotkeys kinfocenter kmenuedit konsole5 kscreen kscreenlocker ksshaskpass ksysguard kwalletmanager5 kwebkitpart kwin pam-kwallet phonon-backend-gstreamer phonon-qt5-backend-gstreamer pinentry-qt plasma-breeze plasma-desktop plasma-desktop-doc plasma-drkonqi plasma-nm plasma-nm-l2tp plasma-nm-openconnect plasma-nm-openswan plasma-nm-openvpn plasma-nm-pptp plasma-nm-vpnc plasma-pa plasma-pk-updates plasma-user-manager plasma-workspace plasma-workspace-geolocation polkit-kde qt5-qtbase-gui qt5-qtdeclarative sddm sddm-breeze sddm-kcm sni-qt kate ark spectacle kcalc flatpak xorg-x11-drv-libinput setroubleshoot plasma-systemsettings system-config-language @development-tools @base-x @"Common NetworkManager Submodules" plasma-discover wget liberation-sans-fonts liberation-fonts liberation-serif-fonts liberation-narrow-fonts liberation-mono-fonts liberation-fonts-common google-noto-cjk-fonts google-noto-cjk-fonts-common google-noto-cjk-fonts-common -y 
	else
		sudo dnf install NetworkManager-config-connectivity-fedora adwaita-gtk2-theme bluedevil breeze-icon-theme cagibi colord-kde cups-pk-helper dolphin firewall-config glibc-all-langpacks gnome-keyring-pam kcm_systemd kcolorchooser kde-gtk-config kde-partitionmanager kde-platform-plugin kde-print-manager kde-runtime kde-settings-pulseaudio kde-style-breeze kdegraphics-thumbnailers kdelibs kdeplasma-addons kdialog kdnssd kf5-akonadi-server kf5-akonadi-server-mysql kf5-baloo-file kf5-kipi-plugins kfind kgpg khotkeys kinfocenter kmenuedit konsole5 kscreen kscreenlocker ksshaskpass ksysguard kwalletmanager5 kwebkitpart kwin pam-kwallet phonon-backend-gstreamer phonon-qt5-backend-gstreamer pinentry-qt plasma-breeze plasma-desktop plasma-desktop-doc plasma-drkonqi plasma-nm plasma-nm-l2tp plasma-nm-openconnect plasma-nm-openswan plasma-nm-openvpn plasma-nm-pptp plasma-nm-vpnc plasma-pa plasma-pk-updates plasma-user-manager plasma-workspace plasma-workspace-geolocation polkit-kde qt5-qtbase-gui qt5-qtdeclarative sddm sddm-breeze sddm-kcm sni-qt kate ark spectacle kcalc flatpak xorg-x11-drv-libinput setroubleshoot plasma-systemsettings system-config-language @development-tools @base-x @"Common NetworkManager Submodules" wget liberation-sans-fonts liberation-fonts liberation-serif-fonts liberation-narrow-fonts liberation-mono-fonts liberation-fonts-common google-noto-cjk-fonts google-noto-cjk-fonts-common google-noto-cjk-fonts-common -y
	fi
fi

##Display Manager
if [ $dechoice = "1" ]
then
	systemctl enable gdm.service
else
	echo ""
fi
if [ $dechoice = "2" ]
then
	systemctl enable sddm
else
	echo ""
fi


##flatpak support
if [ $flathub = "1" ]
then
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo 
else
	echo ""
fi

##Xanmod
if [ $xanmod = "1" ]
then
	dnf copr enable rmnscnce/kernel-xanmod -y
	dnf install kernel-xanmod-edge kernel-xanmod-edge-headers -y
	echo 'exclude=kernel' >> /etc/dnf/dnf.conf
else
	echo ""
fi

##reboot prompt
echo "Would you like to restart your system now ?"
echo "If no you can use your system in CLI until you reboot."
echo "1 = yes 0 = no"
restart=1
read restart
if [ $restart = "1" ]
then
	systemctl set-default graphical.target
	reboot
else
	echo "You can restart using the reboot command"
	echo "(reboot)"
fi

