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
echo "Please select your OS:"
echo "1. ubuntu"
echo "2. arch"
echo "3. mac"
read -p "Enter your choice by integer: " choice

case $choice in
1) SYSTEM="ubuntu" ;;
2) SYSTEM="arch" ;;
3) SYSTEM="mac" ;;
*) echo "Invalid input. Please try again." ;;
esac

if [ "$SYSTEM" = "ubuntu" ]; then
	# Install using apt-get
elif [ "$SYSTEM" = "arch" ]; then
	# Install using pacman
  ./pacman-install.sh
  ./yay-things.sh
  ./brew-install.sh
  ./bicep-curl.sh
  ./got.sh
  ./cargo-shipment.sh
  ../stowit.sh
elif [ "$SYSTEM" = "mac" ]; then
	# Install using brew
  ./brew-install.sh
  ./bicep-curl.sh
  ./got.sh
  ./cargo-shipment.sh
  ../stowit.sh
else
	echo "Unknown OS: $SYSTEM":while [[ condition ]]; do
	 
	done
fi

echo -e "Thank you for installing \xF0\x9F\x92\xA9 you may still need global npm tools; and please run exec zsh" | lolcat
