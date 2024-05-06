# Based off https://github.com/jrcharney/ArchWSLPlusPlus/tree/main

# mainly a list of things to download for a fresh wsl Arch lkinux setup
# with a mac, I like to use Warp terminal with some of these tools installed as well but through homebrew

sudo pacman-key --init && /
sudo pacman-key --populate && /
sudo pacman -Syu
sudo pacman -S archlinux-keyring            # Note: ArchWSL says this is optional, but THIS PACKAGE IS MANDATORY! It should be the first one installed.
sudo pacman -S --needed base-devel git      # When you install the `base-devel` package for ArchWSL, `fakeroot` and `fakeroot-tcp` are in conflict. When asked if you want to replace `fakeroot-tcp` with `fakeroot` SAY NO!
mkdir Projects Downloads Documents          # Just some placeholder directories. I should really make them soft-links to their Windows counterpart later.
mkdir bin                                   # Add this directory. It should be added to your `$PATH`. You can use this directory to launch scripts that you write to do tasks
cd Downloads                                # Switch to the Downloads directory
git clone https://aur.archlinux.org/yay.git # This will install `yay` which will allow you access to the ArchLinux User Repository.
cd yay                                      # Go to the yay directory (This should be in the Downloads directory)
makepkg -si                                 # Make the `yay` package, this will also install the Go Language (`golang`) that `yay` needs to do stuff.
yay --version                               # Verify that yay was installed.
rm -rf ~/yay                                # With yay successfully installed, you may remove the `yay` folder in your home directory. (This is optional)
cd ~
sudo pacman -S openssh unzip stow github-cli pv fzf clang llvm rust python-pip lm_sensors psutils python-psutil neofetch htop bashtop imagemagick jq # Show a list of shells we can change to.  (You can also see this in `/etc/shells`)

sudo pacman -S zsh
curl -sS https://starship.rs/install.sh | sh
exec zsh # Restart zsh

sudo pacman -S tmux                                               # Install the terminal multiplexer. (We'll have some basic stuff set up in `~/.tmux.conf`)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # Install the TMUX plugin manager.

sudo pacman -S lolcat lsd neovim powerline k9s ripgrep

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash # Installs node version manager and adds to .zshrc

Restart

nvm install 20
corepack enable # Installs yarn corepack is shipped with NodeJS now
yarn -v

yay -S --noconfirm google-cloud-cli # Google Cloud CLI gcloud

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&
	unzip awscliv2.zip
sudo ./aws/install # AWS CLI

curl -fL https://install-cli.jfrog.io | sh # JFrog CLI

curl -fsSL https://deno.land/install.sh | sh # Deno

# Install Krew
(
	set -x
	cd "$(mktemp -d)" &&
		OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
		ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
		KREW="krew-${OS}_${ARCH}" &&
		curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
		tar zxvf "${KREW}.tar.gz" &&
		./"${KREW}" install krew
)

yay -S --noconfirm aws-session-manager-plugin

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

TER_VER=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1')
wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip

unzip terraform_${TER_VER}_linux_amd64.zip

sudo mv terraform /usr/local/bin/

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
sudo pacman -S thefuck

npm install --global cdktf-cli@latest

curl -fsSL https://ollama.com/install.sh | sh

ollama pull codellama

curl -fsSL https://get.pulumi.com | sh

pacman -Syu bind
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo pacman -S base-devel procps-ng curl file git
brew install alacritty
