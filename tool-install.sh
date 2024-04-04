#!/bin/bash

cat <<"EOF"
                      __       //
                      -\~,\=\ //
                    --=_\=---//=
                  -_ =/  \/ //\/
                  _,~/   |_   _|\,
     __          ,/_/    \' | `/_
    //\\          /       | | |\_
   /(\ _\________/        (,_,)`
  J(\_/                       \
 ,)\/     v                \   |
 / Y      (         Y       | /J
(7 |       \        |       '/ \
 '| (       /\_______\_     _Y_  \
 'Y \     / \     7   \   /   \  \
 ',) (   /   )   /    |  /    (  )
   '~(  )   / __/     i J     / /      
     \  /   \ \       | |   _/ /
     | |     )_\_     )_\_/__\/
     /_\     |___\    |___\
EOF

echo "WELCOME to the tool installer! This is meant for Unix/Linux"
echo "Please select your preferred package manager:"
echo "1. apt-get"
echo "2. pacman"
echo "3. homebrew"
read -p "Enter your choice by integer: " choice

case $choice in
1) PACKAGE_MANAGER="apt-get" ;;
2) PACKAGE_MANAGER="pacman" ;;
3) PACKAGE_MANAGER="brew" ;;
*) echo "Invalid input. Please try again." ;;
esac

if [ "$PACKAGE_MANAGER" = "apt-get" ]; then
	# Install using apt-get
	INSTALL="sudo apt-get install -y "
  TOOLS=""
elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
	# Install using pacman
	INSTALL="sudo pacman -S --noconfirm "
  TOOLS="openssh unzip stow github-cli pv zsh tmux lolcat lsd neovim powerline k9s ripgrep thefuck fzf clang llvm rust python-pip lm_sensors psutils python-psutil neofetch htop bashtop imagemagick jq"
elif [ "$PACKAGE_MANAGER" = "brew" ]; then
	# Install using brew
	INSTALL="brew install "
  TOOLS="stow go github-cli zsh tmux lolcat lsd neovim powerline k9s ripgrep thefuck fzf neofetch htop bashtop jq "
else
	echo "Unknown package manager: $PACKAGE_MANAGER":while [[ condition ]]; do
	 
	done
fi

function install_tools() {
	$INSTALL $TOOLS
}

function curl_tools() {
  curl -sS https://starship.rs/install.sh | sh && /
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && /
  curl -fsSL https://deno.land/install.sh | sh && /
  curl -fL https://install-cli.jfrog.io | sh && /
  curl -fsSL https://ollama.com/install.sh | sh && /
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash && /
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&
    unzip awscliv2.zip && /
  sudo ./aws/install && /
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && /
  chmod 700 get_helm.sh && /
  ./get_helm.sh && /
  TER_VER=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1') && /
  wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip && /
  unzip terraform_${TER_VER}_linux_amd64.zip && /
  sudo mv terraform /usr/local/bin/
}

function git_things() {
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && /
}

function make_dirs() {
  mkdir Projects bin Work 
  if [ "$PACKAGE_MANAGER" != "brew" ]; then
    mkdri Downloads Documents
  fi
}

function yay_things() {
  yay -S --noconfirm google-cloud-cli && /
  yay -S --noconfirm aws-session-manager-plugin
}

function stow_it() {
  cd ~/dotfiles && stow bash git starship tmux zsh nvim tmuxifier
}

function get_krewed() {
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

}

make_dirs

if [ "$PACKAGE_MANAGER" = "pacman" ]; then
  sudo pacman-key --init && /
  sudo pacman-key --populate && /
  sudo pacman -Syu && /
  sudo pacman -S --noconfirm archlinux-keyring && /
  sudo pacman -S --noconfirm --needed base-devel git && /
  cd Downloads && /
  git clone https://aur.archlinux.org/yay.git && /
  cd yay && /
  makepkg -si && /
  rm -rf ~/yay && /
  cd ~
fi

install_tools
yay_things
curl_tools
git_things
get_krewed
stow_it

echo -e "Thank you for installing \xF0\x9F\x92\xA9 you may still need global npm tools; and please run exec zsh" | lolcat
