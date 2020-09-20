type_Termux=0
type_Ubuntu=0
type_Kali=0
type_Macintosh=0

checkType (){
	if [ -f ~/../usr/bin/termux-info ]; then
		type_Termux=1
	elif [ "$(cat /etc/os-release | grep -o Ubuntu | uniq)" == "Ubuntu" ]; then
		type_Ubuntu=1
	elif [ "$(cat /etc/os-release | grep -o Kali | uniq)" == "Kali" ]; then 
		type_Kali=1
	elif [[ $OSTYPE == "darwin"* ]]; then
		type_Macintosh=1
	fi
}

checkType

if [[ "$type_Termux" == "1" ]]; then

	# Package Management
	alias update="apt update"
	alias upgrade="apt upgrade -y"
	alias search="apt-cache search"
	alias install="apt install -y"
	alias remove="apt remove"
	alias purge="apt purge"
	alias updateall="apt update && apt upgrade -y && apt dist-upgrade && apt autoremove -y"

	# ls Aliases
	alias l="ls -lFh"
	alias ll="ls -lFh"
	alias la="ls -laFh"

elif [[ "$type_NetHunter" == "1" ]]; then

	# Package Management
	alias update="apt update"
	alias upgrade="apt upgrade"
	alias dist-upgrade="apt dist-upgrade"
	alias search="apt-cache search"
	alias install="apt install"
	alias updateall="apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove"

	# ls Aliases
	alias l="ls -lFh"
	alias ll="ls -lFh"
	alias la="ls -laFh"

elif [[ "$type_Ubuntu" == "1" ]]; then

	# Package Management
	alias update="sudo apt update"
	alias upgrade="sudo apt upgrade"
	alias dist-upgrade="sudo apt dist-upgrade"
	alias search="sudo apt-cache search"
	alias install="sudo apt install"
	alias updateall="sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y"

	# ls Aliases
	alias l="ls -lFh"
	alias ll="ls -lFh"
	alias la="ls -laFh"

elif [[ "$type_Kali" == "1" ]]; then

	# Package Management
	alias update="sudo apt update"
	alias upgrade="sudo apt upgrade"
	alias dist-upgrade="sudo apt dist-upgrade"
	alias search="sudo apt-cache search"
	alias install="sudo apt install"	
	alias updateall="sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y"

	# ls Aliases
	alias l="ls -lFh"
	alias ll="ls -lFh"
	alias la="ls -laFh"

fi

unset type_Termux type_Ubuntu type_Kali type_Macintosh
