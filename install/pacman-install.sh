sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Syu
sudo pacman -S archlinux-keyring

sudo pacman -S --needed base-devel git procps-ng curl file
mkdir Projects Downloads Documents bin Work
cd Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
rm -rf ~/yay
cd ~

sudo pacman -S bind openssh unzip pv clang llvm python-pip lm_sensors psutils python-psutil imagemagick

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
