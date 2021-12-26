# Check if root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    echo "Exiting..."
    exit 1
fi

# Install packages
pacman -S xdg-utils                 # Allows Discord to be able to open links
pacman -S ntfs-3g                   # Allows linux to read an external hard drive from windows (ntfs)
pacman -S htop                      # System monitoring tool
pacman -S linux-firmware            # Linux firmware
pacman -S gdm                       # GNOME Display Manager
pacman -S gnome gnome-extra         # GNOME desktop environment
pacman -S powertop                  # Power consumpiton monitoring tool
pacman -S gcc                       # GNU C Compiler
pacman -S nodejs                    # NodeJS
pacman -S xf86-video-intel          # Xorg Intel video drivers
pacman -S openssh                   # SSH client / server
pacman -S bluez bluez-utils         # Bluetooth protocol drivers / stack
pacman -S xf86-input-libinput       # Xorg input drivers (for trackpad and other input devices)
pacman -S wavemon                   # WiFi signal monitoring tool
pacman -S evince                    # GNOME document viewer

# Remove Packages
pacman -Rs qterminal                # Shouldn't be installed but just incase
pacman -Rs geary                    # Mail client
pacman -Rs epiphany                 # Web browser
pacman -Rs accerciser               # Python accessibility manager
pacman -Rs gnome-software           # GNOME software store
pacman -Rs gnome-todo               # Todo app
pacman -Rs gnome-contacts           # Contacts client
pacman -Rs gnome-maps               # Maps client
pacman -Rs folks                    # Keeps track of contacts
pacman -Rs evolution-data-server    # Runs various stuff like calendar / clocks / unneccessary junk
pacman -Rs gnome-calendar           # Calendar client
pacman -Rs gnome-weather            # Weather client
pacman -Rs geoclue                  # Geo location library, probably can't remove this

# Services
systemctl disable --now geoclue     # Disables geoclue since it can't be removed
