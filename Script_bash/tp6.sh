#!/bin/bash
choix=""
read -p "Merci de rentrer un nom d'utilisateur :" nom trash
while [ -z $nom ]; do
	read -p "Merci d'apprendre Ã  lire et de rentrer un nom d'utilisateur :" nom trash
done
echo "GESTION DE L'UTILISATEUR : $nom"
echo -e "\n"
echo "C - CrÃ©er un compte utilisateur"
echo "M - Modifier le mot de passe utilisateur"
echo "S - Supprimer le compte utilisateur"
echo "V - VÃ©rifier si le compte utilisateur existe"
echo "Q - Quitter"

while [[ $choix != "q"|| $choix != "Q" ]]; do
read -p "Votre choix :" choix trash
case $choix in
	#choix 1 crÃ©ation d'un utilisateur
	"c"|"C") 
	# effectue la vÃ©rification de l'id
	if  id $nom &>/dev/null; then
		# renvoi la commande que l'utilisateur existe deja
		echo -e "\e[1;41;30mCOMPTE DEJA EXISTANT\e[0m"
	else
		# crÃ©e l'utilisateur en mode sudo
		sudo useradd -m -s /bin/bash $nom
		echo -e "\e[1;32mL'Utilisateur $nom Ã  Ã©tÃ© crÃ©e\e[0m"
	fi ;;
	# effectue le changement de mdp
	"m"|"M") sudo passwd $nom ;;
	"s"|"S") sudo deluser --remove-all-files $nom &>/dev/null
		echo "\e[1;41;30mL'Utilisateur est supprimÃ©\e[0m" ;;
	"v"|"V")  
	if id $nom &>/dev/null; then
		echo "\e[1;32mL'utilisateur existe\e[0m"
	else
		echo "L'Utilisateur n'existe pas veuilez choisir l'option C"
	fi ;;
	"q"|"Q") exit 0 ;;

	*) echo "Veuillez taper une lettre uniquement" ;;
esac
done