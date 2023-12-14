# déploiement d'image disque

## Introduction

gain de temps et efficacité = productivité
une solution de gain de productivité serait de tendre vers un parc informatique homogene, il est toujours plus efficace de gerer un parc de poste client & serveur de meme marque = idée utopique
Tendre vers un ensemble de systeme d'exploitation homogenes pour reduire les temps de maintenance
interessant (selon les budget et dans la mesure du possible) de posseder des OS "clé en main" pour les nouveaux collaborateurs et les collaborateurs avec un poste défaillant
Pour cela une solution existe = les **images de référence**

## Le MASTER (l'image de référence)

une image de ref est un OS pret a etre demarrer, a jour et dans l'absolu possedant les logiciel de l'entreprise pret a l'emploi.

Pour creer une image de reference il faudra

- installer l'OS
- sur un ordinateur avec une conf materiel la plus standard dans l'entreprise
- faire la config initial de l'OS
  - pilote etc
- installation app de base et metier [version validé par la DSI](facultatif)
- preparer le systeme a etre *cloner* avec l'outil natif **sysprep**

### sysprep

logiciel natif MS utilisé pour rendre les postes uniques dans l'entreprise, sont but est de reinitialiser les parametre personnalisé du MASTER.
il existe une version de sysprep native par generation OS (sysprep win10 , serveur2022 etc)

Possibilité de l'utilisé via l'interface graph ou en CLI pour plus de précision

parametre nécessaire pour bien l'utiliser:

- Interface graphique

lancer sysprep (action de nettoyage du poste) pour ensuite rentrer en mode **OOBE (out of box experience)** (interaction utilisateur au redémarrage) mode permettant de rentrer les 1ere config apres le demarrage de sortie d'usine.
Cocher la case **generaliser** etape essentiel permettant de generer un nouveau SID d'ordinateur au prochain redémarrage, chaque ordinateur du parc doit posseder un SID unique pour joindre un domaine active directory.
Arreter le systeme pour capturer son image *a froid* (OS principal non demarré) pour pouvoir le deployer sur un ou plusieurs ordinateur du parc

- Ligne de commande

Il s'agit des memes etapes qu'avec l'interface graphique via l'utilitaire cmd `sysprep` suivi des options `/oobe` `/generalize` `/shutdown`

```cmd
c:\windows\system32\sysprep\sysprep.exe /oobe /generalize /shutdown
```

En complément on pourra redemarrer le poste en mode :

- audit : redemarre le poste avant l'**OOBE** pour effectuer un pré-paramétrage spécifiques au poste (installation des soft ou drivers qui doivent etre conservé a l'issu du sysprep généralisé)
- journaux sysprep consultables apres redemarrage dans les répertoires **Panther**
`c:\Windows\system32\sysprep\panther`

sysprep n'est pas compatible avec :

- toutes les configurations (roles serveur, jonction, etc.)
- incompatible avec des apps installées depuis le microsoft store (apps lié au compte utilisateur)
- pilotes installés manuellement
  - supprimés par défaut par sysprep
  - non supprimés avec le parametre `/PersistAllDeviceInstalls` en CLI ou les ajouter au magasin de pilote windows
- les compte utilisateur de la base SAM ne sont pas supprimé (possibilité de le faire avec le compte admin avant master)
- seule le compte admin est reinitialiser par sysprep
- Activez et utilisez le compte admin pour un parametrage plus précis

## Exploitation d'un master

une fois le systeme de reference eteint, cad une fois le sysprep realiser, ne pas redemarrer le poste de reference avant d'avoir *capturer* l'image crée par sysprep.
>Si redemarrage du poste de ref avant *capture* de l'image cela annule le sysprep et oblige a en refaire 1

Capture de l'image en demarrant l'ordinateur en le faisant booter sur un autre OS (un OS permettant de creer, de conserver et d'exporter l'image du master)
2 possibilités :

1. boot via la carte reseau en amorcage PXE (Pre-boot eXecution Environment). la carte reseau ira chercher un OS sur un serveur dedié a cela (serveur de deploiement) via un automatisme ce chargera de capturer le systeme de l'ordinateur pour la transferer en image .VIM. cela permet en general d'archiver des images qui sera possible de deployer sur des postes cibles afin de gagner du temps et de ne pas avoir a installer windows manuellement.
2. Boot sur un support WinPE amorçable (DVD,Clé USB,etc), WinPE pour windows Preinstallation Environment est un mini OS en CLI qui possede plusieurs outils en lien avec la capture et le deploiement d'image. sa commande principale est DISM (deploiment image service and mangement tool)

une fois l'image capturer et en notre possesion il est possible de la mettre a jour en mode offline avec la cmd dism. (possibilité d'integrer des KB, des logiciels, des drivers)

possibilité en amont que le poste cible est pret a recevoir l'OS en le testant et en validant sa config materiel en fonction des prerequis de l'OS.
certain utilitaire gratuit existe sur le site de MS.
s'assurer que le poste cible possede un volume pret a acceuillir les fichiers du futur systeme.
WinPE possede des outils tels que (diskpart, mount, powershell, netuse, bcdedit,bdcboot...)

## Deploiement d'une image

en possesion de l'image .vim possibilité de la deployer via le serveur de deploiement.
Pratique pour faire du deploiement de masse, celui-ci s'occupe de l'installation et de la validation des nouveaux ordinateur celui-ci s'en charge pour rendre les ordinateurs pret a l'emploi.
Pour connaitre un deploiement par le serveur les ordinateurs cible devront booter sur le reseau, se connecter au serveur, choisir l'image de reference qui sera deployer

sans serveur il est possible de faire un deploiement au cas par cas via le suppor bootable winPE et a la cmd DISMil faudra d'abord creer le volume d'acceuil qui hebergera le contenu de l'image VIM
