# Systeme d'aide Powershell

Powershell propose de l'aide pour l'utilisation et la comprehension de ce langage

Systeme d'aide intégré complet pour :

- obtenir des informations sur l'usage des commandes
- obtenir des informations sur les concepts de powershell

PS v1 et v2 aide intégré nativement
PS v3 et plus aide telechargeable (sur internet, sur un serveur local) en anglais
avantage: mettre a jour l'aide, obtenir les dernieres version actualisées

la mise a jour de l'aide est indispensable au debut de l'utilisation de PowerShell
Pour effectuer les maj de l'aide il faut etre administrateur.
cmdlets pour maj l'aide via internet : Update-help [-force] pour outrepasser la limite d'une MAJ/j

Possibilité également de faire la maj via un serveur privée pour un systeme non connecté a internet.
Pré-requis avoir un dépot local (sur un srveur d'entreprise)

```Powershell
cmdlets : Update-Help -SourcePath \\chemin\vers\aide\powershell -UIculture enen-US -credential
```

Pour utiliser l'aide PS on peut utliser :

- cmdlets Get-Help `recherche` pour un affichage entier
- Help `recherche` pour un affichage page par page
- Man `recherche` pour 'manual' emprunter du monde unix est un alias de HELP
- `recherche` -? (disponible depuis toutes les cmdlets)

- Get-help Disable-LocalUser = Affiche l'aide de la cmdlets Disable-LocalUSer
- help help = affiche "l'aide de l'aide" page par page
- Man about_variables
  - Affiche le manuel d'utilisation des variables PS, page par page
  - Help about_* = affiche la liste des concepts disponibles
  - [Permet d'avoir une lecon au sujet de la notion de variable et de son utilisation]

toutes les sections d'aide commencant `about_` apporte des info sur une notion du langage PS

Astuces:

- Get-help -Examples `recherche` =affiche les exemples d'utilisation de la cmdlets souhaité
- Get-help -showWindows `recherche`> = affiche l'aide complete dans une fenetre séparée
- Get-help -Online `recherche` = Affiche l'aide à jour détaillée disponible sur les serveurs Microsoft (navigateur internet requis)
